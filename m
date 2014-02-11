Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1B68E006C6
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 06:55:05 -0800 (PST)
Received: by mail-qa0-f49.google.com with SMTP id w8so11649030qac.22
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2014 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=jmFt3aZN1uraefV1HD8NSJstzQj7lzHNCPHP/OP9OYE=;
	b=mI2NUZavavZNCV07NfAoxL2WjyVNprnyNUBk0kwlBn2cekar+cMlahdANuWEw0ljeY
	W/ruxwayaCxxHReq59arwFSMxmJ8FOenmWdtPwIUBp+lvyAi7AcKE4ngOTMv88QQxPL6
	0jTws3VHZ/69GPIC8PD78spU5cF4DlsnHHimvt6GEyqsn7VlQVBD9Ufv/yicbVv8jWJD
	w7DfONDNlyLyZfb7IF0FkdS55IBqNoz/8IBL/IZ8S104FcgTzOwef3fGTgedruqdr7ie
	yWfovX5C9kNSxW98BpgNg7DGK9US0krdYXeaHqkc65MpGUf722QeWPqnFy53s2iNXYfb
	C69g==
X-Received: by 10.140.91.198 with SMTP id z64mr4431067qgd.32.1392130504690;
	Tue, 11 Feb 2014 06:55:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Tue, 11 Feb 2014 06:54:44 -0800 (PST)
In-Reply-To: <20140211145214.GH3131@edge>
References: <1687303.zqgYtDvr2z@kgy-pc>
	<321768C95D21724485BCE784F1BE98473EB8E6DA@DBDE04.ent.ti.com>
	<2080630.Ym40fTraDf@kgy-pc>
	<CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Tue, 11 Feb 2014 12:54:44 -0200
Message-ID: <CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: How to compile omap3-sgx-modules_4.09.00.01
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
X-List-Received-Date: Tue, 11 Feb 2014 14:55:06 -0000
Content-Type: multipart/alternative; boundary=001a113a2cae36923804f222a479

--001a113a2cae36923804f222a479
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2014 at 12:52 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> PREFERRED_VERSION_blah =3D "ver"


Can I add it im my image recipe, or do I need to add it on machine.conf?
Why the newest version is not selected by default?

Abra=E7os,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

Engenheiro de Controle e Automa=E7=E3o
UNIVERSIDADE FEDERAL DE ITAJUB=C0

/*long live rock 'n roll*/

--001a113a2cae36923804f222a479
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Feb 11, 2014 at 12:52 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<=
a href=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span=
> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">PREFERRED_VERSION_blah =3D &quot;ver&quot;</=
blockquote></div><br>Can I add it im my image recipe, or do I need to add i=
t on machine.conf?</div>

<div class=3D"gmail_extra">Why the newest version is not selected by defaul=
t?<br><br clear=3D"all"><div><div dir=3D"ltr"><div>Abra=E7os,</div><div><br=
></div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a h=
ref=3D"http://www.embarcados.com.br" target=3D"_blank">www.embarcados.com.b=
r</a><br>

<br>Engenheiro de Controle e Automa=E7=E3o<br>UNIVERSIDADE FEDERAL DE ITAJU=
B=C0<br><br>/*long live rock &#39;n roll*/</div></div>
</div></div>

--001a113a2cae36923804f222a479--
