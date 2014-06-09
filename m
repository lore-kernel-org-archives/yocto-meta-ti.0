Return-Path: <diego.sueiro@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E624EE00B6C; Mon,  9 Jun 2014 03:04:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (diego.sueiro[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.54 listed in list.dnswl.org]
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 56826E00A44
	for <meta-ti@yoctoproject.org>; Mon,  9 Jun 2014 03:04:37 -0700 (PDT)
Received: by mail-qa0-f54.google.com with SMTP id j15so7713635qaq.27
	for <meta-ti@yoctoproject.org>; Mon, 09 Jun 2014 03:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=HARu6unDqsWSlqw4+p9vIFl3K0kbd045i+RHnoySQpM=;
	b=VFVBV92e9VvoHWDWGutCvtGdNOrMl/V8T97EdLcFcCYUIYTsQ3XD+c8mUr/Vlhs8JJ
	2XxrOBbK26W/t0iKpE0rKwUsraDV3oT5AZF9vUyc5c5/HVyxV3ZTqm5parobLgTKEWg1
	vHuYBy9NBNAnsh76/HMDvjEyMFLZyHXwnFeKjr82rJX5XwIgJN9J7HM4Yy/AxUU5ve8p
	EfUb8WshOtgFzzN7W6dj+wBQRPNdI6vsB28WK4sQAHAKT+0c1oh3Cgq4hgBrdH9HoXT5
	DovtSUbaB1ALVpqYEmn17kXRPKeuWwGNqEcUpLvcZgutyNuk4XD6X4tNySIJpyhmCZOX
	I5hg==
X-Received: by 10.140.86.178 with SMTP id p47mr29406475qgd.66.1402308277174;
	Mon, 09 Jun 2014 03:04:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.48.112 with HTTP; Mon, 9 Jun 2014 03:04:17 -0700 (PDT)
In-Reply-To: <5394FEA0.1020602@emagii.com>
References: <5392397D.4000504@emagii.com>
	<7fe72dbd-40a2-4730-a737-ac67ef21c9a1@email.android.com>
	<5392BE20.2000509@emagii.com> <5394FEA0.1020602@emagii.com>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Mon, 9 Jun 2014 07:04:17 -0300
Message-ID: <CAMCfZKHYWGdStwbGVjnfqC3O3zj5j4qPmsq9jH=U9s_a92EtRA@mail.gmail.com>
To: Ulf Samuelsson <meta-ti@emagii.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building qt5 using Yocto+meta-ti possible for Beaglebone?
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
X-List-Received-Date: Mon, 09 Jun 2014 10:04:51 -0000
Content-Type: multipart/alternative; boundary=001a11c13d5cba0b0804fb6456a1

--001a11c13d5cba0b0804fb6456a1
Content-Type: text/plain; charset=ISO-8859-1

Ulf,

On Sun, Jun 8, 2014 at 9:24 PM, Ulf Samuelsson <meta-ti@emagii.com> wrote:

> Romber Nelson and some other people mention that the 3.12 kernel used is
> not compatible with the advanced capes like LCDs.
> Do I need to revert to the 3.8 kernel?
>

Kernel 3.12 does not have cape manager capabilities, as far as I know.
Did you tested it in a HDMI monitor/TV?


Regrads,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br
<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>

/*long live rock 'n roll*/

--001a11c13d5cba0b0804fb6456a1
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">Ulf,</div><div class=3D"gmail_e=
xtra"><br><div class=3D"gmail_quote">On Sun, Jun 8, 2014 at 9:24 PM, Ulf Sa=
muelsson <span dir=3D"ltr">&lt;<a href=3D"mailto:meta-ti@emagii.com" target=
=3D"_blank">meta-ti@emagii.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":4eg" class=3D"a3s" style=3D"over=
flow:hidden">Romber Nelson and some other people mention that the 3.12 kern=
el used is not compatible with the advanced capes like LCDs.<br>


Do I need to revert to the 3.8 kernel?</div></blockquote></div><div class=
=3D"gmail_extra"><br></div>Kernel 3.12 does not have cape manager capabilit=
ies, as far as I know.</div><div class=3D"gmail_extra">Did you tested it in=
 a HDMI monitor/TV?<br>

<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Regrads,</div><div><br></d=
iv>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href=
=3D"http://www.embarcados.com.br/?utm_source=3Dassinatura_diego&amp;utm_med=
ium=3De-mail&amp;utm_campaign=3DAssinatura%20Email%20Diego" target=3D"_blan=
k">www.embarcados.com.br</a><br>

<br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--001a11c13d5cba0b0804fb6456a1--
