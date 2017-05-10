# Automatically generated using Clang.jl wrap_c, version 0.0.0

const OBJC_NEW_PROPERTIES = 1

# Skipping MacroDefinition: FGAPI __attribute__ ( ( visibility ( "default" ) ) )

const FG_VERSION = "0.9.2"
const FG_VERSION_MAJOR = 0
const FG_VERSION_MINOR = 9
const FG_VERSION_PATCH = 2
const FG_API_VERSION = FG_API_VERSION_CURRENT

const fg_window = Ptr{Void}
const fg_font = Ptr{Void}
const fg_chart = Ptr{Void}
const fg_image = Ptr{Void}
const fg_histogram = Ptr{Void}
const fg_plot = Ptr{Void}
const fg_surface = Ptr{Void}
const fg_vector_field = Ptr{Void}

# begin enum ANONYMOUS_1
# const ANONYMOUS_1 = UInt32
const FG_ERR_NONE = (UInt32)(0)
const FG_ERR_SIZE = (UInt32)(1001)
const FG_ERR_INVALID_TYPE = (UInt32)(1002)
const FG_ERR_INVALID_ARG = (UInt32)(1003)
const FG_ERR_GL_ERROR = (UInt32)(2001)
const FG_ERR_FREETYPE_ERROR = (UInt32)(3001)
const FG_ERR_FILE_NOT_FOUND = (UInt32)(4001)
const FG_ERR_NOT_SUPPORTED = (UInt32)(5001)
const FG_ERR_NOT_CONFIGURED = (UInt32)(5002)
const FG_ERR_FONTCONFIG_ERROR = (UInt32)(6001)
const FG_ERR_FREEIMAGE_UNKNOWN_FORMAT = (UInt32)(7001)
const FG_ERR_FREEIMAGE_BAD_ALLOC = (UInt32)(7002)
const FG_ERR_FREEIMAGE_SAVE_FAILED = (UInt32)(7003)
const FG_ERR_INTERNAL = (UInt32)(9001)
const FG_ERR_RUNTIME = (UInt32)(9002)
const FG_ERR_UNKNOWN = (UInt32)(9003)
# end enum ANONYMOUS_1

# begin enum fg_err
const fg_err = UInt32
const FG_ERR_NONE = (UInt32)(0)
const FG_ERR_SIZE = (UInt32)(1001)
const FG_ERR_INVALID_TYPE = (UInt32)(1002)
const FG_ERR_INVALID_ARG = (UInt32)(1003)
const FG_ERR_GL_ERROR = (UInt32)(2001)
const FG_ERR_FREETYPE_ERROR = (UInt32)(3001)
const FG_ERR_FILE_NOT_FOUND = (UInt32)(4001)
const FG_ERR_NOT_SUPPORTED = (UInt32)(5001)
const FG_ERR_NOT_CONFIGURED = (UInt32)(5002)
const FG_ERR_FONTCONFIG_ERROR = (UInt32)(6001)
const FG_ERR_FREEIMAGE_UNKNOWN_FORMAT = (UInt32)(7001)
const FG_ERR_FREEIMAGE_BAD_ALLOC = (UInt32)(7002)
const FG_ERR_FREEIMAGE_SAVE_FAILED = (UInt32)(7003)
const FG_ERR_INTERNAL = (UInt32)(9001)
const FG_ERR_RUNTIME = (UInt32)(9002)
const FG_ERR_UNKNOWN = (UInt32)(9003)
# end enum fg_err

# begin enum ANONYMOUS_2
# const ANONYMOUS_2 = UInt32
const FG_GRAYSCALE = (UInt32)(100)
const FG_RG = (UInt32)(200)
const FG_RGB = (UInt32)(300)
const FG_BGR = (UInt32)(301)
const FG_RGBA = (UInt32)(400)
const FG_BGRA = (UInt32)(401)
# end enum ANONYMOUS_2

# begin enum fg_channel_format
const fg_channel_format = UInt32
const FG_GRAYSCALE = (UInt32)(100)
const FG_RG = (UInt32)(200)
const FG_RGB = (UInt32)(300)
const FG_BGR = (UInt32)(301)
const FG_RGBA = (UInt32)(400)
const FG_BGRA = (UInt32)(401)
# end enum fg_channel_format

# begin enum ANONYMOUS_3
# const ANONYMOUS_3 = UInt32
const FG_CHART_2D = (UInt32)(2)
const FG_CHART_3D = (UInt32)(3)
# end enum ANONYMOUS_3

# begin enum fg_chart_type
const fg_chart_type = UInt32
const FG_CHART_2D = (UInt32)(2)
const FG_CHART_3D = (UInt32)(3)
# end enum fg_chart_type

# begin enum ANONYMOUS_4
# const ANONYMOUS_4 = UInt32
const FG_COLOR_MAP_DEFAULT = (UInt32)(0)
const FG_COLOR_MAP_SPECTRUM = (UInt32)(1)
const FG_COLOR_MAP_RAINBOW = (UInt32)(2)
const FG_COLOR_MAP_RED = (UInt32)(3)
const FG_COLOR_MAP_MOOD = (UInt32)(4)
const FG_COLOR_MAP_HEAT = (UInt32)(5)
const FG_COLOR_MAP_BLUE = (UInt32)(6)
const FG_COLOR_MAP_INFERNO = (UInt32)(7)
const FG_COLOR_MAP_MAGMA = (UInt32)(8)
const FG_COLOR_MAP_PLASMA = (UInt32)(9)
const FG_COLOR_MAP_VIRIDIS = (UInt32)(10)
# end enum ANONYMOUS_4

# begin enum fg_color_map
const fg_color_map = UInt32
const FG_COLOR_MAP_DEFAULT = (UInt32)(0)
const FG_COLOR_MAP_SPECTRUM = (UInt32)(1)
const FG_COLOR_MAP_RAINBOW = (UInt32)(2)
const FG_COLOR_MAP_RED = (UInt32)(3)
const FG_COLOR_MAP_MOOD = (UInt32)(4)
const FG_COLOR_MAP_HEAT = (UInt32)(5)
const FG_COLOR_MAP_BLUE = (UInt32)(6)
const FG_COLOR_MAP_INFERNO = (UInt32)(7)
const FG_COLOR_MAP_MAGMA = (UInt32)(8)
const FG_COLOR_MAP_PLASMA = (UInt32)(9)
const FG_COLOR_MAP_VIRIDIS = (UInt32)(10)
# end enum fg_color_map

# begin enum ANONYMOUS_5
# const ANONYMOUS_5 = UInt32
const FG_RED = (UInt32)(0x00000000ff0000ff)
const FG_GREEN = (UInt32)(16711935)
const FG_BLUE = (UInt32)(65535)
const FG_YELLOW = (UInt32)(0x00000000ffff00ff)
const FG_CYAN = (UInt32)(16777215)
const FG_MAGENTA = (UInt32)(0x00000000ff00ffff)
const FG_WHITE = (UInt32)(0x00000000ffffffff)
const FG_BLACK = (UInt32)(255)
# end enum ANONYMOUS_5

# begin enum fg_color
const fg_color = UInt32
const FG_RED = (UInt32)(0x00000000ff0000ff)
const FG_GREEN = (UInt32)(16711935)
const FG_BLUE = (UInt32)(65535)
const FG_YELLOW = (UInt32)(0x00000000ffff00ff)
const FG_CYAN = (UInt32)(16777215)
const FG_MAGENTA = (UInt32)(0x00000000ff00ffff)
const FG_WHITE = (UInt32)(0x00000000ffffffff)
const FG_BLACK = (UInt32)(255)
# end enum fg_color

# begin enum ANONYMOUS_6
# const ANONYMOUS_6 = UInt32
const FG_INT8 = (UInt32)(0)
const FG_UINT8 = (UInt32)(1)
const FG_INT32 = (UInt32)(2)
const FG_UINT32 = (UInt32)(3)
const FG_FLOAT32 = (UInt32)(4)
const FG_INT16 = (UInt32)(5)
const FG_UINT16 = (UInt32)(6)
# end enum ANONYMOUS_6

# begin enum fg_dtype
const fg_dtype = UInt32
const FG_INT8 = (UInt32)(0)
const FG_UINT8 = (UInt32)(1)
const FG_INT32 = (UInt32)(2)
const FG_UINT32 = (UInt32)(3)
const FG_FLOAT32 = (UInt32)(4)
const FG_INT16 = (UInt32)(5)
const FG_UINT16 = (UInt32)(6)
# end enum fg_dtype

# begin enum ANONYMOUS_7
# const ANONYMOUS_7 = UInt32
const FG_PLOT_LINE = (UInt32)(0)
const FG_PLOT_SCATTER = (UInt32)(1)
const FG_PLOT_SURFACE = (UInt32)(2)
# end enum ANONYMOUS_7

# begin enum fg_plot_type
const fg_plot_type = UInt32
const FG_PLOT_LINE = (UInt32)(0)
const FG_PLOT_SCATTER = (UInt32)(1)
const FG_PLOT_SURFACE = (UInt32)(2)
# end enum fg_plot_type

# begin enum ANONYMOUS_8
# const ANONYMOUS_8 = UInt32
const FG_MARKER_NONE = (UInt32)(0)
const FG_MARKER_POINT = (UInt32)(1)
const FG_MARKER_CIRCLE = (UInt32)(2)
const FG_MARKER_SQUARE = (UInt32)(3)
const FG_MARKER_TRIANGLE = (UInt32)(4)
const FG_MARKER_CROSS = (UInt32)(5)
const FG_MARKER_PLUS = (UInt32)(6)
const FG_MARKER_STAR = (UInt32)(7)
# end enum ANONYMOUS_8

# begin enum fg_marker_type
const fg_marker_type = UInt32
const FG_MARKER_NONE = (UInt32)(0)
const FG_MARKER_POINT = (UInt32)(1)
const FG_MARKER_CIRCLE = (UInt32)(2)
const FG_MARKER_SQUARE = (UInt32)(3)
const FG_MARKER_TRIANGLE = (UInt32)(4)
const FG_MARKER_CROSS = (UInt32)(5)
const FG_MARKER_PLUS = (UInt32)(6)
const FG_MARKER_STAR = (UInt32)(7)
# end enum fg_marker_type
