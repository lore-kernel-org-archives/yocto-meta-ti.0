Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f171.google.com (mail-qc0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C42A7E00C1B
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 10:47:16 -0700 (PDT)
Received: by mail-qc0-f171.google.com with SMTP id c9so762582qcz.2
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 10:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LEbjzZsreReh2y8dkmIDA7W+6nAosuctr27pLQZKmp4=;
	b=GadAQtznWefp6EmwAmo1PxIMYGGc+5pXJG9qtQf0DnNxTg5KrN6KB9rUKsHDGYnazI
	OlSqK6We1fIB3K/oBlCDKLUDF0ZqXRU0dgudLg5Zi7AGrARo5K2XK9fvtKXlF9wgzTr9
	4Qm2TFJEWl277khSrbp6iO+GJf8V/W3ZSnvU+s0/Gs27t+zq9g8NRUV8ey2rAKXkgi55
	8xKB5tsE65Lxb067ldsIkRhLk/ZCkLo3o07BMVDIg0ZKla9BhEvhUCJvXWBCD0FhskcP
	TqYmsSV50IjLvxTh32GYuaflrb6cre4d5boT7vhjodj/QmHHhxp5arqqA7FTmTpBmyjd
	9PjA==
X-Received: by 10.140.85.116 with SMTP id m107mr12182735qgd.78.1397756835894; 
	Thu, 17 Apr 2014 10:47:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.40.114 with HTTP; Thu, 17 Apr 2014 10:46:54 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473ED03FDE@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
	<CAMCfZKF-nRvJm_Yjn5yGisEcySShKQ-D8mRb2ofYZ41S_J3Hkw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03DD6@DBDE04.ent.ti.com>
	<CAMCfZKFz7Twh7o-3zCfbF9dQyJum7LfL+YY-K+3A4F5AwjuTSA@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03FDE@DBDE04.ent.ti.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 17 Apr 2014 14:46:54 -0300
Message-ID: <CAMCfZKHhQbH1_a=gWQ=8OSgaxssopQVO6mzKOtjGktjE-R8jiA@mail.gmail.com>
To: "Sundareson, Prabindh" <prabu@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: AM3359 with OpenVG libraries
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
X-List-Received-Date: Thu, 17 Apr 2014 17:47:19 -0000
Content-Type: multipart/alternative; boundary=001a11c123deafa13004f7409f1f

--001a11c123deafa13004f7409f1f
Content-Type: text/plain; charset=ISO-8859-1

Prabu,

On Thu, Apr 17, 2014 at 2:34 PM, Sundareson, Prabindh <prabu@ti.com> wrote:

> Do you have some pointers to why regular Qt widgets are only accelerated
> by VG and not with GL ?


At http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html:

> Using OpenGL ES with Qt
> To use OpenGL-enabled widgets in a Qt for Embedded application, all that
> is required is to subclass QGLWidget and draw into instances of the
> subclass with standard OpenGL functions. The current implementation only
> supports OpenGL ES and 2D painting within a QGLWidget. Using OpenGL ES to
> accelerate regular widgets as well as compositing top-level windows with
> OpenGL ES are not currently supported. These issues will be addressed in
> future versions of Qt.
> Note: The OpenGL paint engine is not currently supported in regular
> widgets. However, any application that uses QGraphicsView can set a
> QGLWidget as the viewport and obtain access to the OpenGL paint engine that
> way:



Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c123deafa13004f7409f1f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Prabu,</div><div class=3D"gmail=
_extra"><br><div class=3D"gmail_quote">On Thu, Apr 17, 2014 at 2:34 PM, Sun=
dareson, Prabindh <span dir=3D"ltr">&lt;<a href=3D"mailto:prabu@ti.com" tar=
get=3D"_blank">prabu@ti.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">Do you have some pointers to why regular Qt widgets are on=
ly accelerated by VG and not with GL ?</blockquote>

</div><div class=3D"gmail_extra"><br></div>At=A0<a href=3D"http://qt-projec=
t.org/doc/qt-4.8/qt-embeddedlinux-opengl.html">http://qt-project.org/doc/qt=
-4.8/qt-embeddedlinux-opengl.html</a>:</div><div class=3D"gmail_extra"><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;paddi=
ng-left:1ex">

Using OpenGL ES with Qt<br>To use OpenGL-enabled widgets in a Qt for Embedd=
ed application, all that is required is to subclass QGLWidget and draw into=
 instances of the subclass with standard OpenGL functions. The current impl=
ementation only supports OpenGL ES and 2D painting within a QGLWidget. Usin=
g OpenGL ES to accelerate regular widgets as well as compositing top-level =
windows with OpenGL ES are not currently supported. These issues will be ad=
dressed in future versions of Qt.<br>

Note: The OpenGL paint engine is not currently supported in regular widgets=
. However, any application that uses QGraphicsView can set a QGLWidget as t=
he viewport and obtain access to the OpenGL paint engine that way:</blockqu=
ote>

<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regards,</div><div><br></d=
iv>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_med=
ium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blan=
k">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c123deafa13004f7409f1f--
