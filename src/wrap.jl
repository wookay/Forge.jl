# Julia wrapper for header: /Users/wookyoung/arrayfire/forge/include/forge.h
# Automatically generated using Clang.jl wrap_c, version 0.0.0


function fg_update_vertex_buffer(pBufferId::UInt32,pBufferSize::UInt32,pBufferData)
    ccall((:fg_update_vertex_buffer,libforge),fg_err,(UInt32,Csize_t,Ptr{Void}),pBufferId,pBufferSize,pBufferData)
end

function fg_update_pixel_buffer(pBufferId::UInt32,pBufferSize::UInt32,pBufferData)
    ccall((:fg_update_pixel_buffer,libforge),fg_err,(UInt32,Csize_t,Ptr{Void}),pBufferId,pBufferSize,pBufferData)
end

function fg_finish()
    ccall((:fg_finish,libforge),fg_err,())
end

function fg_get_last_error(msg,len)
    ccall((:fg_get_last_error,libforge),Void,(Ptr{Cstring},Ptr{Cint}),msg,len)
end

function fg_err_to_string(err::fg_err)
    ccall((:fg_err_to_string,libforge),Cstring,(fg_err,),err)
end

function fg_create_font(pFont)
    ccall((:fg_create_font,libforge),fg_err,(Ptr{fg_font},),pFont)
end

function fg_destroy_font(pFont::fg_font)
    ccall((:fg_destroy_font,libforge),fg_err,(fg_font,),pFont)
end

function fg_load_font_file(pFont::fg_font,pFileFullPath)
    ccall((:fg_load_font_file,libforge),fg_err,(fg_font,Cstring),pFont,pFileFullPath)
end

function fg_load_system_font(pFont::fg_font,pFontName)
    ccall((:fg_load_system_font,libforge),fg_err,(fg_font,Cstring),pFont,pFontName)
end

function fg_create_image(pImage,pWidth::UInt32,pHeight::UInt32,pFormat::fg_channel_format,pType::fg_dtype)
    ccall((:fg_create_image,libforge),fg_err,(Ptr{fg_image},UInt32,UInt32,fg_channel_format,fg_dtype),pImage,pWidth,pHeight,pFormat,pType)
end

function fg_destroy_image(pImage::fg_image)
    ccall((:fg_destroy_image,libforge),fg_err,(fg_image,),pImage)
end

function fg_set_image_alpha(pImage::fg_image,pAlpha::Cfloat)
    ccall((:fg_set_image_alpha,libforge),fg_err,(fg_image,Cfloat),pImage,pAlpha)
end

function fg_set_image_aspect_ratio(pImage::fg_image,pKeepRatio::Bool)
    ccall((:fg_set_image_aspect_ratio,libforge),fg_err,(fg_image,Bool),pImage,pKeepRatio)
end

function fg_get_image_width(pOut,pImage::fg_image)
    ccall((:fg_get_image_width,libforge),fg_err,(Ptr{UInt32},fg_image),pOut,pImage)
end

function fg_get_image_height(pOut,pImage::fg_image)
    ccall((:fg_get_image_height,libforge),fg_err,(Ptr{UInt32},fg_image),pOut,pImage)
end

function fg_get_image_pixelformat(pOut,pImage::fg_image)
    ccall((:fg_get_image_pixelformat,libforge),fg_err,(Ptr{fg_channel_format},fg_image),pOut,pImage)
end

function fg_get_image_type(pOut,pImage::fg_image)
    ccall((:fg_get_image_type,libforge),fg_err,(Ptr{fg_dtype},fg_image),pOut,pImage)
end

function fg_get_pixel_buffer(pOut,pImage::fg_image)
    ccall((:fg_get_pixel_buffer,libforge),fg_err,(Ptr{UInt32},fg_image),pOut,pImage)
end

function fg_get_image_size(pOut,pImage::fg_image)
    ccall((:fg_get_image_size,libforge),fg_err,(Ptr{UInt32},fg_image),pOut,pImage)
end

function fg_render_image(pWindow::fg_window,pImage::fg_image,pX::Cint,pY::Cint,pWidth::Cint,pHeight::Cint)
    ccall((:fg_render_image,libforge),fg_err,(fg_window,fg_image,Cint,Cint,Cint,Cint),pWindow,pImage,pX,pY,pWidth,pHeight)
end

function fg_create_plot(pPlot,pNPoints::UInt32,pType::fg_dtype,pChartType::fg_chart_type,pPlotType::fg_plot_type,pMarkerType::fg_marker_type)
    ccall((:fg_create_plot,libforge),fg_err,(Ptr{fg_plot},UInt32,fg_dtype,fg_chart_type,fg_plot_type,fg_marker_type),pPlot,pNPoints,pType,pChartType,pPlotType,pMarkerType)
end

function fg_destroy_plot(pPlot::fg_plot)
    ccall((:fg_destroy_plot,libforge),fg_err,(fg_plot,),pPlot)
end

function fg_set_plot_color(pPlot::fg_plot,pRed::Cfloat,pGreen::Cfloat,pBlue::Cfloat,pAlpha::Cfloat)
    ccall((:fg_set_plot_color,libforge),fg_err,(fg_plot,Cfloat,Cfloat,Cfloat,Cfloat),pPlot,pRed,pGreen,pBlue,pAlpha)
end

function fg_set_plot_legend(pPlot::fg_plot,pLegend)
    ccall((:fg_set_plot_legend,libforge),fg_err,(fg_plot,Cstring),pPlot,pLegend)
end

function fg_set_plot_marker_size(pPlot::fg_plot,pMarkerSize::Cfloat)
    ccall((:fg_set_plot_marker_size,libforge),fg_err,(fg_plot,Cfloat),pPlot,pMarkerSize)
end

function fg_get_plot_vertex_buffer(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_vertex_buffer,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_color_buffer(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_color_buffer,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_alpha_buffer(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_alpha_buffer,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_radii_buffer(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_radii_buffer,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_vertex_buffer_size(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_vertex_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_color_buffer_size(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_color_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_alpha_buffer_size(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_alpha_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_get_plot_radii_buffer_size(pOut,pPlot::fg_plot)
    ccall((:fg_get_plot_radii_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_plot),pOut,pPlot)
end

function fg_create_surface(pSurface,pXPoints::UInt32,pYPoints::UInt32,pType::fg_dtype,pPlotType::fg_plot_type,pMarkerType::fg_marker_type)
    ccall((:fg_create_surface,libforge),fg_err,(Ptr{fg_surface},UInt32,UInt32,fg_dtype,fg_plot_type,fg_marker_type),pSurface,pXPoints,pYPoints,pType,pPlotType,pMarkerType)
end

function fg_destroy_surface(pSurface::fg_surface)
    ccall((:fg_destroy_surface,libforge),fg_err,(fg_surface,),pSurface)
end

function fg_set_surface_color(pSurface::fg_surface,pRed::Cfloat,pGreen::Cfloat,pBlue::Cfloat,pAlpha::Cfloat)
    ccall((:fg_set_surface_color,libforge),fg_err,(fg_surface,Cfloat,Cfloat,Cfloat,Cfloat),pSurface,pRed,pGreen,pBlue,pAlpha)
end

function fg_set_surface_legend(pSurface::fg_surface,pLegend)
    ccall((:fg_set_surface_legend,libforge),fg_err,(fg_surface,Cstring),pSurface,pLegend)
end

function fg_get_surface_vertex_buffer(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_vertex_buffer,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_get_surface_color_buffer(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_color_buffer,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_get_surface_alpha_buffer(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_alpha_buffer,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_get_surface_vertex_buffer_size(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_vertex_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_get_surface_color_buffer_size(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_color_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_get_surface_alpha_buffer_size(pOut,pSurface::fg_surface)
    ccall((:fg_get_surface_alpha_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_surface),pOut,pSurface)
end

function fg_create_vector_field(pField,pNPoints::UInt32,pType::fg_dtype,pChartType::fg_chart_type)
    ccall((:fg_create_vector_field,libforge),fg_err,(Ptr{fg_vector_field},UInt32,fg_dtype,fg_chart_type),pField,pNPoints,pType,pChartType)
end

function fg_destroy_vector_field(pField::fg_vector_field)
    ccall((:fg_destroy_vector_field,libforge),fg_err,(fg_vector_field,),pField)
end

function fg_set_vector_field_color(pField::fg_vector_field,pRed::Cfloat,pGreen::Cfloat,pBlue::Cfloat,pAlpha::Cfloat)
    ccall((:fg_set_vector_field_color,libforge),fg_err,(fg_vector_field,Cfloat,Cfloat,Cfloat,Cfloat),pField,pRed,pGreen,pBlue,pAlpha)
end

function fg_set_vector_field_legend(pField::fg_vector_field,pLegend)
    ccall((:fg_set_vector_field_legend,libforge),fg_err,(fg_vector_field,Cstring),pField,pLegend)
end

function fg_get_vector_field_vertex_buffer(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_vertex_buffer,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_color_buffer(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_color_buffer,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_alpha_buffer(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_alpha_buffer,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_direction_buffer(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_direction_buffer,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_vertex_buffer_size(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_vertex_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_color_buffer_size(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_color_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_alpha_buffer_size(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_alpha_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_get_vector_field_direction_buffer_size(pOut,pField::fg_vector_field)
    ccall((:fg_get_vector_field_direction_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_vector_field),pOut,pField)
end

function fg_create_histogram(pHistogram,pNBins::UInt32,pDataType::fg_dtype)
    ccall((:fg_create_histogram,libforge),fg_err,(Ptr{fg_histogram},UInt32,fg_dtype),pHistogram,pNBins,pDataType)
end

function fg_destroy_histogram(pHistogram::fg_histogram)
    ccall((:fg_destroy_histogram,libforge),fg_err,(fg_histogram,),pHistogram)
end

function fg_set_histogram_color(pHistogram::fg_histogram,pRed::Cfloat,pGreen::Cfloat,pBlue::Cfloat,pAlpha::Cfloat)
    ccall((:fg_set_histogram_color,libforge),fg_err,(fg_histogram,Cfloat,Cfloat,Cfloat,Cfloat),pHistogram,pRed,pGreen,pBlue,pAlpha)
end

function fg_set_histogram_legend(pHistogram::fg_histogram,pLegend)
    ccall((:fg_set_histogram_legend,libforge),fg_err,(fg_histogram,Cstring),pHistogram,pLegend)
end

function fg_get_histogram_vertex_buffer(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_vertex_buffer,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_get_histogram_color_buffer(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_color_buffer,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_get_histogram_alpha_buffer(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_alpha_buffer,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_get_histogram_vertex_buffer_size(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_vertex_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_get_histogram_color_buffer_size(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_color_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_get_histogram_alpha_buffer_size(pOut,pHistogram::fg_histogram)
    ccall((:fg_get_histogram_alpha_buffer_size,libforge),fg_err,(Ptr{UInt32},fg_histogram),pOut,pHistogram)
end

function fg_create_chart(pHandle,pChartType::fg_chart_type)
    ccall((:fg_create_chart,libforge),fg_err,(Ptr{fg_chart},fg_chart_type),pHandle,pChartType)
end

function fg_destroy_chart(pHandle::fg_chart)
    ccall((:fg_destroy_chart,libforge),fg_err,(fg_chart,),pHandle)
end

function fg_set_chart_axes_titles(pHandle::fg_chart,pX,pY,pZ)
    ccall((:fg_set_chart_axes_titles,libforge),fg_err,(fg_chart,Cstring,Cstring,Cstring),pHandle,pX,pY,pZ)
end

function fg_set_chart_axes_limits(pHandle::fg_chart,pXmin::Cfloat,pXmax::Cfloat,pYmin::Cfloat,pYmax::Cfloat,pZmin::Cfloat,pZmax::Cfloat)
    ccall((:fg_set_chart_axes_limits,libforge),fg_err,(fg_chart,Cfloat,Cfloat,Cfloat,Cfloat,Cfloat,Cfloat),pHandle,pXmin,pXmax,pYmin,pYmax,pZmin,pZmax)
end

function fg_get_chart_axes_limits(pXmin,pXmax,pYmin,pYmax,pZmin,pZmax,pHandle::fg_chart)
    ccall((:fg_get_chart_axes_limits,libforge),fg_err,(Ptr{Cfloat},Ptr{Cfloat},Ptr{Cfloat},Ptr{Cfloat},Ptr{Cfloat},Ptr{Cfloat},fg_chart),pXmin,pXmax,pYmin,pYmax,pZmin,pZmax,pHandle)
end

function fg_set_chart_legend_position(pHandle::fg_chart,pX::Cfloat,pY::Cfloat)
    ccall((:fg_set_chart_legend_position,libforge),fg_err,(fg_chart,Cfloat,Cfloat),pHandle,pX,pY)
end

function fg_add_image_to_chart(pImage,pHandle::fg_chart,pWidth::UInt32,pHeight::UInt32,pFormat::fg_channel_format,pType::fg_dtype)
    ccall((:fg_add_image_to_chart,libforge),fg_err,(Ptr{fg_image},fg_chart,UInt32,UInt32,fg_channel_format,fg_dtype),pImage,pHandle,pWidth,pHeight,pFormat,pType)
end

function fg_add_histogram_to_chart(pHistogram,pHandle::fg_chart,pNBins::UInt32,pType::fg_dtype)
    ccall((:fg_add_histogram_to_chart,libforge),fg_err,(Ptr{fg_histogram},fg_chart,UInt32,fg_dtype),pHistogram,pHandle,pNBins,pType)
end

function fg_add_plot_to_chart(pPlot,pHandle::fg_chart,pNPoints::UInt32,pType::fg_dtype,pPlotType::fg_plot_type,pMarkerType::fg_marker_type)
    ccall((:fg_add_plot_to_chart,libforge),fg_err,(Ptr{fg_plot},fg_chart,UInt32,fg_dtype,fg_plot_type,fg_marker_type),pPlot,pHandle,pNPoints,pType,pPlotType,pMarkerType)
end

function fg_add_surface_to_chart(pSurface,pHandle::fg_chart,pXPoints::UInt32,pYPoints::UInt32,pType::fg_dtype,pPlotType::fg_plot_type,pMarkerType::fg_marker_type)
    ccall((:fg_add_surface_to_chart,libforge),fg_err,(Ptr{fg_surface},fg_chart,UInt32,UInt32,fg_dtype,fg_plot_type,fg_marker_type),pSurface,pHandle,pXPoints,pYPoints,pType,pPlotType,pMarkerType)
end

function fg_add_vector_field_to_chart(pField,pHandle::fg_chart,pNPoints::UInt32,pType::fg_dtype)
    ccall((:fg_add_vector_field_to_chart,libforge),fg_err,(Ptr{fg_vector_field},fg_chart,UInt32,fg_dtype),pField,pHandle,pNPoints,pType)
end

function fg_render_chart(pWindow::fg_window,pChart::fg_chart,pX::Cint,pY::Cint,pWidth::Cint,pHeight::Cint)
    ccall((:fg_render_chart,libforge),fg_err,(fg_window,fg_chart,Cint,Cint,Cint,Cint),pWindow,pChart,pX,pY,pWidth,pHeight)
end

function fg_get_chart_type(pChartType,pChart::fg_chart)
    ccall((:fg_get_chart_type,libforge),fg_err,(Ptr{fg_chart_type},fg_chart),pChartType,pChart)
end

function fg_create_window(pWindow,pWidth::Cint,pHeight::Cint,pTitle,pShareWindow::fg_window,pInvisible::Bool)
    ccall((:fg_create_window,libforge),fg_err,(Ptr{fg_window},Cint,Cint,Cstring,fg_window,Bool),pWindow,pWidth,pHeight,pTitle,pShareWindow,pInvisible)
end

function fg_destroy_window(pWindow::fg_window)
    ccall((:fg_destroy_window,libforge),fg_err,(fg_window,),pWindow)
end

function fg_set_window_font(pWindow::fg_window,pFont::fg_font)
    ccall((:fg_set_window_font,libforge),fg_err,(fg_window,fg_font),pWindow,pFont)
end

function fg_set_window_title(pWindow::fg_window,pTitle)
    ccall((:fg_set_window_title,libforge),fg_err,(fg_window,Cstring),pWindow,pTitle)
end

function fg_set_window_position(pWindow::fg_window,pX::Cint,pY::Cint)
    ccall((:fg_set_window_position,libforge),fg_err,(fg_window,Cint,Cint),pWindow,pX,pY)
end

function fg_set_window_size(pWindow::fg_window,pWidth::UInt32,pHeight::UInt32)
    ccall((:fg_set_window_size,libforge),fg_err,(fg_window,UInt32,UInt32),pWindow,pWidth,pHeight)
end

function fg_set_window_colormap(pWindow::fg_window,pColorMap::fg_color_map)
    ccall((:fg_set_window_colormap,libforge),fg_err,(fg_window,fg_color_map),pWindow,pColorMap)
end

function fg_get_window_context_handle(pContext,pWindow::fg_window)
    ccall((:fg_get_window_context_handle,libforge),fg_err,(Ptr{Clonglong},fg_window),pContext,pWindow)
end

function fg_get_window_display_handle(pDisplay,pWindow::fg_window)
    ccall((:fg_get_window_display_handle,libforge),fg_err,(Ptr{Clonglong},fg_window),pDisplay,pWindow)
end

function fg_get_window_width(pWidth,pWindow::fg_window)
    ccall((:fg_get_window_width,libforge),fg_err,(Ptr{Cint},fg_window),pWidth,pWindow)
end

function fg_get_window_height(pHeight,pWindow::fg_window)
    ccall((:fg_get_window_height,libforge),fg_err,(Ptr{Cint},fg_window),pHeight,pWindow)
end

function fg_make_window_current(pWindow::fg_window)
    ccall((:fg_make_window_current,libforge),fg_err,(fg_window,),pWindow)
end

function fg_get_window_grid(pRows,pCols,pWindow::fg_window)
    ccall((:fg_get_window_grid,libforge),fg_err,(Ptr{Cint},Ptr{Cint},fg_window),pRows,pCols,pWindow)
end

function fg_hide_window(pWindow::fg_window)
    ccall((:fg_hide_window,libforge),fg_err,(fg_window,),pWindow)
end

function fg_show_window(pWindow::fg_window)
    ccall((:fg_show_window,libforge),fg_err,(fg_window,),pWindow)
end

function fg_close_window(pIsClosed,pWindow::fg_window)
    ccall((:fg_close_window,libforge),fg_err,(Ptr{Bool},fg_window),pIsClosed,pWindow)
end

function fg_draw_image(pWindow::fg_window,pImage::fg_image,pKeepAspectRatio::Bool)
    ccall((:fg_draw_image,libforge),fg_err,(fg_window,fg_image,Bool),pWindow,pImage,pKeepAspectRatio)
end

function fg_draw_chart(pWindow::fg_window,pChart::fg_chart)
    ccall((:fg_draw_chart,libforge),fg_err,(fg_window,fg_chart),pWindow,pChart)
end

function fg_setup_window_grid(pRows::Cint,pCols::Cint,pWindow::fg_window)
    ccall((:fg_setup_window_grid,libforge),fg_err,(Cint,Cint,fg_window),pRows,pCols,pWindow)
end

function fg_draw_image_to_cell(pWindow::fg_window,pRowId::Cint,pColId::Cint,pImage::fg_image,pTitle,pKeepAspectRatio::Bool)
    ccall((:fg_draw_image_to_cell,libforge),fg_err,(fg_window,Cint,Cint,fg_image,Cstring,Bool),pWindow,pRowId,pColId,pImage,pTitle,pKeepAspectRatio)
end

function fg_draw_chart_to_cell(pWindow::fg_window,pRowId::Cint,pColId::Cint,pChart::fg_chart,pTitle)
    ccall((:fg_draw_chart_to_cell,libforge),fg_err,(fg_window,Cint,Cint,fg_chart,Cstring),pWindow,pRowId,pColId,pChart,pTitle)
end

function fg_swap_window_buffers(pWindow::fg_window)
    ccall((:fg_swap_window_buffers,libforge),fg_err,(fg_window,),pWindow)
end

function fg_save_window_framebuffer(pFullPath,pWindow::fg_window)
    ccall((:fg_save_window_framebuffer,libforge),fg_err,(Cstring,fg_window),pFullPath,pWindow)
end
