Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f181.google.com (mail-qc0-f181.google.com
	[209.85.216.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B38B9E00C04
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 03:58:33 -0700 (PDT)
Received: by mail-qc0-f181.google.com with SMTP id x3so231871qcv.40
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 03:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=hjmMU4velin60tL5lb2BFyiGlQFc8couyjMt+DHsnNg=;
	b=mAu4ogMQKwBoWcwHs8pHQ9odi/BKlGVTGGQP82j2L4DSlTwf59WZuLAdn6UVzgseOM
	uITurncfc1cNWJ/iva+0QXyQ2NYvRHjqitcOMCwBrX5cBA2stFAMOG6SvrRBJeH/XG26
	lJd1P4HeRXdzZYd6L1lpHycu8GIc0HVrEgR/akmNJIBjlK6wOvtKuGVx0hv4p1nrxweH
	j3ZG8lmX1012PkAckiiK0vMeXdUiI0GXCDBlJGJ1e7wAd82IOLmdtYoOpgBDfIDGTd5W
	zO3R2SOBKJ4zTDTf5SUfFbPSj/g1aB+ik+UDu+tXUPKMetT2ATV9qgKcK1I+lpRXq9ux
	o+XQ==
X-Received: by 10.224.20.72 with SMTP id e8mr9351341qab.86.1397732312584; Thu,
	17 Apr 2014 03:58:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.40.114 with HTTP; Thu, 17 Apr 2014 03:58:11 -0700 (PDT)
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 17 Apr 2014 07:58:11 -0300
Message-ID: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: AM3359 with OpenVG libraries
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
X-List-Received-Date: Thu, 17 Apr 2014 10:58:33 -0000
Content-Type: multipart/alternative; boundary=001a11c1bfeafb99e204f73ae9f8

--001a11c1bfeafb99e204f73ae9f8
Content-Type: text/plain; charset=ISO-8859-1

Folks,

Looking at this commit:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/recipes-graphics/libgles?id=91b307e78a98033f49a77a9664d89462e33030a3

It says that OpenVG is no longer supported by SGX Graphics SDK.
What is the reason for that?
What is the latest SGX SDK version in which supports OpenVG?

I want to use Qt embedded with 2D hardware graphics acceleration and
according to Qt embedded
documentation<http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-openvg.html>
just
need to use QPaintEngine to get regular widgets accelerated by the hardware.



Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c1bfeafb99e204f73ae9f8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style>Folks,</div><div style><br></div><div style>Loo=
king at this commit:</div><div style><a href=3D"http://git.yoctoproject.org=
/cgit/cgit.cgi/meta-ti/commit/recipes-graphics/libgles?id=3D91b307e78a98033=
f49a77a9664d89462e33030a3">http://git.yoctoproject.org/cgit/cgit.cgi/meta-t=
i/commit/recipes-graphics/libgles?id=3D91b307e78a98033f49a77a9664d89462e330=
30a3</a></div>

<div style><br></div><div style>It says that OpenVG is no longer supported =
by SGX Graphics SDK.</div><div style>What is the reason for that?</div><div=
 style>What is the latest SGX SDK version in which supports OpenVG?</div>

<div style><br></div><div style>I want to use Qt embedded with 2D hardware =
graphics acceleration and according to Qt embedded <a href=3D"http://qt-pro=
ject.org/doc/qt-4.8/qt-embeddedlinux-openvg.html">documentation</a>=A0just =
need to use QPaintEngine to get regular widgets accelerated by the hardware=
.</div>

<div style><br></div><div style><br></div><br clear=3D"all"><div><div dir=
=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego Sueiro<br><br=
>Administrador do Embarcados<br><a href=3D"http://www.embarcados.com.br/?ut=
m_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_campaign=3DAssi=
natura%20Email%20Diego" target=3D"_blank">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div>

--001a11c1bfeafb99e204f73ae9f8--
