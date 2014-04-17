Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A20CE00BA3
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 06:56:56 -0700 (PDT)
Received: by mail-qg0-f50.google.com with SMTP id q108so427620qgd.23
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 06:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=wQEHBUZcN19gWJQ23FRFK0TO85xCpDb+mld7OwLRqYM=;
	b=c1eLtjeaed12O2CDUPOwDRepQB21uw7bmhc2YTdYTU2sBZ1+c4+ngo0xXxGpw2XQF9
	m/wnjFkwo2yzLAOC7S40AEJoFd5NnIujdYb+mikHSeInK6I5zPqaQKwbt+kPfzqDbb8n
	1rX3SQxY6IJZuWBGGiUwsRgCJmnEmHbVUvkOtszjX5wnrHPzN6toYoS4+4F6QX9y3eRc
	Nq91pUstGJ2FA761eEMwTBAeroQaHiGyD0LRI8HIQvtx/WVqzwpqju6fItg3Mmj4IW0E
	LWMBxd5ok0Kzq8gnRxd6+wI1bobuJM9khgD91EGqKES/VmhzmMgahTzHF/SCMMYWCHOd
	BBBA==
X-Received: by 10.224.20.72 with SMTP id e8mr10590467qab.86.1397743016115;
	Thu, 17 Apr 2014 06:56:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.40.114 with HTTP; Thu, 17 Apr 2014 06:56:36 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 17 Apr 2014 10:56:36 -0300
Message-ID: <CAMCfZKF-nRvJm_Yjn5yGisEcySShKQ-D8mRb2ofYZ41S_J3Hkw@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 13:56:57 -0000
Content-Type: multipart/alternative; boundary=001a11c1bfeaf699f004f73d670b

--001a11c1bfeaf699f004f73d670b
Content-Type: text/plain; charset=ISO-8859-1

Prabu,

On Thu, Apr 17, 2014 at 10:36 AM, Sundareson, Prabindh <prabu@ti.com> wrote:

> You should really be looking at OpenGLES2 for Qt4 (and Qt5) 2D Hardware
> acceleration from an acceleration roadmap perspective - Ex this
> http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html.


The problem in using OpenGL ES2 is that it could not get accelerated
hardware for Qt regular widgets for Qt 4.8.
I'm looking for a solution to use all Qt graphical framework for 2D in
accelerated hardware.

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c1bfeaf699f004f73d670b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Prabu,<div class=3D"gmail_extra"><br><div class=3D"gmail_q=
uote">On Thu, Apr 17, 2014 at 10:36 AM, Sundareson, Prabindh <span dir=3D"l=
tr">&lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span style=3D"font-size:11.0pt;font-family:=
&quot;Calibri&quot;,&quot;sans-serif&quot;;color:#1f497d">You should really=
 be looking at OpenGLES2 for Qt4 (and Qt5) 2D Hardware acceleration from an=
 acceleration roadmap perspective &ndash; Ex this
<a href=3D"http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.html" t=
arget=3D"_blank">http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-opengl.h=
tml</a>.</span></blockquote></div><br>The problem in using OpenGL ES2 is th=
at it could not get accelerated hardware for Qt regular widgets for Qt 4.8.=
</div>

<div class=3D"gmail_extra">I&#39;m looking for a solution to use all Qt gra=
phical framework for 2D in accelerated hardware.<br><br clear=3D"all"><div>=
<div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueir=
o<br>

<br>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br/=
?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DA=
ssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br><=
br>/*long live rock &#39;n roll*/<br>

</div></div>
</div></div>

--001a11c1bfeaf699f004f73d670b--
