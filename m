Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f50.google.com (mail-qa0-f50.google.com
	[209.85.216.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F06BE00C1A
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 10:26:08 -0700 (PDT)
Received: by mail-qa0-f50.google.com with SMTP id ih12so658728qab.37
	for <meta-ti@yoctoproject.org>; Thu, 17 Apr 2014 10:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=iFK3VrQlsOqxIh9L31COAmEZzNltH1F6uclMVUZqgjU=;
	b=F0L+U/sxAD8oeX0O3cslvf/f9dG239q6c1DvHp6lstBVaNhgsA1owWRvTKmgN5aE/L
	ZeR7kCf7CRyc5Ozf2gzOw0aOfCuI9vzZ6XHTlmr8Rs7JpAFrmz1bcNE8FtQqcGBfbVXj
	2Y9Mh8flzeTYDryefYV7KYOVNDgxNW/3ceEVQd3kYT1Z0Z6qpzGvPv29BAddvDMR2neI
	+066T6V1byVgwjUkGlWB+jzK5eyq0Z0RZ2yEvl0zTluO9cl7v85sUlAod6TwcBqWfWE3
	OUNLdoYul5ocUx0RhavRaXNdAeXMmbak6zcnocBwSmxVLTxF/R545zKAxgiqEymU3Ees
	MUuw==
X-Received: by 10.229.66.133 with SMTP id n5mr13491291qci.0.1397755567927;
	Thu, 17 Apr 2014 10:26:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.40.114 with HTTP; Thu, 17 Apr 2014 10:25:47 -0700 (PDT)
In-Reply-To: <321768C95D21724485BCE784F1BE98473ED03DD6@DBDE04.ent.ti.com>
References: <CAMCfZKFeeHaAfg6OPeTzN18KSzVCOmA=PCk4YALLgPYoBCVgyg@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03D2E@DBDE04.ent.ti.com>
	<CAMCfZKF-nRvJm_Yjn5yGisEcySShKQ-D8mRb2ofYZ41S_J3Hkw@mail.gmail.com>
	<321768C95D21724485BCE784F1BE98473ED03DD6@DBDE04.ent.ti.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 17 Apr 2014 14:25:47 -0300
Message-ID: <CAMCfZKFz7Twh7o-3zCfbF9dQyJum7LfL+YY-K+3A4F5AwjuTSA@mail.gmail.com>
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
X-List-Received-Date: Thu, 17 Apr 2014 17:26:10 -0000
Content-Type: multipart/alternative; boundary=001a11c2ffee1bf8b204f74054da

--001a11c2ffee1bf8b204f74054da
Content-Type: text/plain; charset=ISO-8859-1

Prabu,
On Thu, Apr 17, 2014 at 11:29 AM, Sundareson, Prabindh <prabu@ti.com> wrote:

> The assumption of VG accelerating widgets better than GL, is questionable
> in this context.


I did not mentioned that VG was better than GL. I just told that regular
widgets is only accelerate with VG.
As soon as I'm using Qt 4.8 embedded, not Qt 5, I need a solution to get
regular widgets accelerated.

On Qt-4.8 embedded documentation it says that OpenVG is supported on
embedded linux:
http://qt-project.org/doc/qt-4.8/qt-embeddedlinux-openvg.html


And the question remains: Why OpenVG was removed on newer versions of SGK
SDK?


Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c2ffee1bf8b204f74054da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Prabu,<br><div class=3D"gmail_q=
uote">On Thu, Apr 17, 2014 at 11:29 AM, Sundareson, Prabindh <span dir=3D"l=
tr">&lt;<a href=3D"mailto:prabu@ti.com" target=3D"_blank">prabu@ti.com</a>&=
gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex">The assumption of VG accelerating widgets better than GL, =
is questionable in this context.</blockquote>

</div><div class=3D"gmail_extra"><br></div>I did not mentioned that VG was =
better than GL. I just told that regular widgets is only accelerate with VG=
.</div><div class=3D"gmail_extra">As soon as I&#39;m using Qt 4.8 embedded,=
 not Qt 5, I need a solution to get regular widgets accelerated.</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra" style>On Qt=
-4.8 embedded documentation it says that OpenVG is supported on embedded li=
nux:</div><div class=3D"gmail_extra" style><a href=3D"http://qt-project.org=
/doc/qt-4.8/qt-embeddedlinux-openvg.html">http://qt-project.org/doc/qt-4.8/=
qt-embeddedlinux-openvg.html</a><br>

</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra" style>And the question remains: Why OpenVG =
was removed on newer versions of SGK SDK?</div><div class=3D"gmail_extra"><=
br>
<br>
<div><div dir=3D"ltr"><div>Regards,</div><div><br></div>--<br>*dS<br>Diego =
Sueiro<br><br>Administrador do Embarcados<br><a href=3D"http://www.embarcad=
os.com.br/?utm_source=3Dassinatura_diego&amp;utm_medium=3De-mail&amp;utm_ca=
mpaign=3DAssinatura%20Email%20Diego" target=3D"_blank">www.embarcados.com.b=
r</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c2ffee1bf8b204f74054da--
