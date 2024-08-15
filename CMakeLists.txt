cmake_minimum_required(VERSION 3.10)
project(hello_drv)

# 由于我的系统更新过内核，所以这里需要设置内核源代码路径
set(KDIR /home/bera/software_pack/T113/tina5.0_v1.0/out/kernel/build/)

# 定义编译函数/方法，驱动编译过程主要在这个函数进行
function(compile_module obj)
  set(TARGET_NAME ${obj})
  # 添加目标，obj即为模块名称。由于我在build目录下构建，所以这里选择将.c和.h文件拷贝到该目录下
  add_custom_target(${TARGET_NAME} 
                    ALL 
                    COMMAND cp -f ${CMAKE_CURRENT_SOURCE_DIR}/*.c ${CMAKE_CURRENT_BINARY_DIR}/
                    # COMMAND cp -f ${CMAKE_CURRENT_SOURCE_DIR}/*.h ${CMAKE_CURRENT_BINARY_DIR}/
                    COMMAND echo "pretask: copy necessary file"
  		    )

  # 设置依赖，相当于Makefile中的 $(MODULE_NAME)-objs += demo_main.o
  #set(depend_objlist "demo_main.o")
  
  # 设置编译命令
  add_custom_command(TARGET ${TARGET_NAME}
		     POST_BUILD
		     COMMAND echo "obj-m := ${obj}.o" >> ${CMAKE_CURRENT_BINARY_DIR}/Makefile
		     #COMMAND echo "${obj}-objs:=${depend_objlist}" >>${CMAKE_CURRENT_BINARY_DIR}/Makefile
		     COMMAND make -C ${KDIR} M=${CMAKE_CURRENT_BINARY_DIR} modules
         
		     )
endfunction()

# 调用编译函数
add_custom_target(module_test 
COMMAND $(CROSS_COMPILE)gcc -o hello_drv_test hello_drv_test.c
)


compile_module(hello_drv)