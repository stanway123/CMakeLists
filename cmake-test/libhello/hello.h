#ifndef _HELLO_H_
#define _HELLO_H_
#if defined _WIN32
	#if LIBHELLO_BUILD
		#define LIBHELLO_API __declspec(dllexport)
	#else
		#define LIBHELLO_API __declspec(dllimport)
	#endif
#else
	#define LIBHELLO_API
#endif
LIBHELLO_API void hello(const char *name);
#endif _HELLO_H_ //_HELLO_H_