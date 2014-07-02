Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F2A50E006F6; Wed,  2 Jul 2014 06:32:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AAF3FE006F1
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 06:32:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s62DWSKL018864;
	Wed, 2 Jul 2014 08:32:28 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62DWSZL019343;
	Wed, 2 Jul 2014 08:32:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 2 Jul 2014 08:32:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s62DWR4v009833;
	Wed, 2 Jul 2014 08:32:27 -0500
Date: Wed, 2 Jul 2014 09:32:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ulf Samuelsson <meta-ti@emagii.com>
Message-ID: <20140702133226.GN15788@edge>
References: <3FE772D53E77C441B4E5285AE1261596694E44E8@AFSESTHEX6.af.se>
	<AB4BC7AE-6073-4AB3-8573-93B92E50D342@emagii.com>
	<53B394EC.1060606@emagii.com> <53B396D4.4060608@emagii.com>
MIME-Version: 1.0
In-Reply-To: <53B396D4.4060608@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 02 Jul 2014 13:32:36 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> When I build an image with QT5 using meta-arago, qtbase fails with a
> lot of error messages.

This is the wrong mailing list - meta-ti has nothing to do with qtbase.

Moreover, why are you still using 5.1.1? There were many fixes in Qt5 5.2.x 
and 5.3.x. Also, it depends on your setup and what layers and features you 
configure. Either way, it's a discussion for a distro layer, you can use 
meta-arago mailing list for that...


> Some errors:
> 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:52:1:
> error: expected class-name before '{' token
> linking part1
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> In destructor 'virtual OpenGLWindow::~OpenGLWindow()':
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> warning: possible problem detected in invocation of delete operator:
> [enabled by default]
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> warning: invalid use of incomplete type 'class QOpenGLPaintDevice'
> [enabled by default]
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> warning: forward declaration of 'class QOpenGLPaintDevice' [enabled
> by default]
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> note: neither the destructor nor the class-specific operator delete
> will be called, even if they are declared when the class is defined
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> In member function 'virtual void OpenGLWindow::render()':
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:78:24:
> error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> error: forward declaration of 'class QOpenGLPaintDevice'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:13:
> error: 'GL_COLOR_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:35:
> error: 'GL_DEPTH_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:57:
> error: 'GL_STENCIL_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:78:
> error: 'glClear' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:82:13:
> error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> error: forward declaration of 'class QOpenGLPaintDevice'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> error: no matching function for call to
> 'QPainter::QPainter(QOpenGLPaintDevice*&)'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> note: candidates are:
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/qpainter.h:1:0,
>                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/QPainter:1,
>                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:47:
> 
> Googling indicates that this is because:
> 
>    "If -no-opengl is specified and OpenGL development files are
> installed, the error does occur."
> 
> If I clean out qtbase, and then continue build, it will complete.
> $ bitbase -c cleansstate qtbase
> $ bitbake <image>
> 
> My guess is that during configuration, OpenGL cannot be found, but
> it is there during compile.
> There seems to be a dependency error (libgles-omap3?).
> 
> 
> 
> 
> BR
> Ulf Samuelsson
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

