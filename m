Return-Path: <meta-ti@emagii.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C2AFE0054C; Wed,  2 Jul 2014 06:31:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [195.67.226.208 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 357A4E003D2
	for <meta-ti@yoctoproject.org>; Wed,  2 Jul 2014 06:31:50 -0700 (PDT)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00F36812 for meta-ti@yoctoproject.org;
	Wed, 2 Jul 2014 15:31:48 +0200
Message-ID: <53B409C4.2070202@emagii.com>
Date: Wed, 02 Jul 2014 15:31:48 +0200
From: Ulf Samuelsson <meta-ti@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <3FE772D53E77C441B4E5285AE1261596694E44E8@AFSESTHEX6.af.se>	<AB4BC7AE-6073-4AB3-8573-93B92E50D342@emagii.com>	<53B394EC.1060606@emagii.com>
	<53B396D4.4060608@emagii.com>
In-Reply-To: <53B396D4.4060608@emagii.com>
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
X-List-Received-Date: Wed, 02 Jul 2014 13:31:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2014-07-02 07:21, Ulf Samuelsson skrev:
> When I build an image with QT5 using meta-arago, qtbase fails with a 
> lot of error messages.
>
I added

DEPENDS += "libgles-omap3"

to my 'qtbase_5.1.1.bbappend'
and now I can rebuild qt5 without this error.

BR
Ulf Samuelsson


>
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
> In file included from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7: 
> warning: forward declaration of 'class QOpenGLPaintDevice' [enabled by 
> default]
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12: 
> note: neither the destructor nor the class-specific operator delete 
> will be called, even if they are declared when the class is defined
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp: 
> In member function 'virtual void OpenGLWindow::render()':
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:78:24: 
> error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> In file included from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
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
> In file included from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7: 
> error: forward declaration of 'class QOpenGLPaintDevice'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30: 
> error: no matching function for call to 
> 'QPainter::QPainter(QOpenGLPaintDevice*&)'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30: 
> note: candidates are:
> In file included from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/qpainter.h:1:0,
>                  from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/QPainter:1,
>                  from 
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:47:
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
> My guess is that during configuration, OpenGL cannot be found, but it 
> is there during compile.
> There seems to be a dependency error (libgles-omap3?).
>
>
>
>
> BR
> Ulf Samuelsson


