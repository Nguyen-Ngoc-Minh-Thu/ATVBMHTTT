// Decompiled by DJ v3.12.12.98 Copyright 2014 Atanas Neshkov  Date: 1/7/2023 10:46:53 AM
// Home Page:  http://www.neshkov.com/dj.html - Check often for new version!
// Decompiler options: packimports(3) 
// Source File Name:   Utf8.java

package Filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;

@WebFilter(filterName="Utf8", urlPatterns={"/*"})
public class Utf8 implements Filter
{

    public void init(FilterConfig filterconfig)
        throws ServletException
    {
    }

    public void destroy()
    {
    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
        throws ServletException, IOException
    {
        request.setCharacterEncoding("utf8");
        response.setCharacterEncoding("utf8");
        chain.doFilter(request, response);
    }
}
