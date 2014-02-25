Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F4B7E008DA;
	Mon, 24 Feb 2014 21:31:00 -0800 (PST)
Received: by mail-ie0-f173.google.com with SMTP id lx4so4438118iec.32
	for <multiple recipients>; Mon, 24 Feb 2014 21:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=1lKlyuox1/mEqZMUxv05dI7E1uGsroNTbRaOLMcOdEQ=;
	b=glg0dpHLye3p7QmQkqAaV8OIM0mfrkxhIavLsDR3UM8gjf4SX13RkIwGVFaOsfvG+Z
	MSP8EHQhZPxAlm8HYhNDA/OcqzLTmQCyd59cPOyMaUeneqvwU55fRVCknYZpMMvZRgQj
	PcCKDM4KlZ7jfSVH5a5hcDsZIbQnCN8mup4P0pH6prIt8BdThPDvSfVxAdJuc8Lh3aik
	nFAxrSw8xwa1qs2PoXp7qnzI2GfnWAwNwoqm0M8ibY9Pakm5Nc13Fs0l5O1Vb8rzv14t
	IHlc507MZvnE31mNCDV6ca1uuHj56XiIdu0a0o8thipEG3Wdf98G5SjaZ6ZwBDW++R7e
	76kQ==
X-Received: by 10.50.43.170 with SMTP id x10mr1190692igl.20.1393306259810;
	Mon, 24 Feb 2014 21:30:59 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Mon, 24 Feb 2014 21:30:29 -0800 (PST)
In-Reply-To: <CANmVirgMuSXcSmHYSaEGazQX=oJTyJQEmrRKGZHE9tprkeM_yw@mail.gmail.com>
References: <CANmVirgMuSXcSmHYSaEGazQX=oJTyJQEmrRKGZHE9tprkeM_yw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Feb 2014 21:30:29 -0800
Message-ID: <CAMKF1srPrJ0PHufvSXQb0D70_=gjnPbD4SzfyOF1=kjqpTxMWQ@mail.gmail.com>
To: Raul Rosetto Munoz <munoz0raul@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
Subject: Re: Device Tree Overlays
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
X-List-Received-Date: Tue, 25 Feb 2014 05:31:01 -0000
Content-Type: multipart/alternative; boundary=089e01176cadadee4c04f33464f3

--089e01176cadadee4c04f33464f3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2014 at 5:34 AM, Raul Rosetto Munoz <munoz0raul@gmail.com>w=
rote:

> I couldnt see this folders:
>
> root@beaglebone:/lib/fir
> =E2=80=8Ban=E2=80=8B
> mware# export SLOTS=3D/sys/devices/bone_capemgr.9/slots
>

=E2=80=8Bc=E2=80=8Ban you use the kernel from meta-beagleboard and check if=
 you get cape
support

--089e01176cadadee4c04f33464f3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Mon, Feb 24, 2014 at 5:34 AM, Raul Rosetto Munoz <span dir=3D"ltr">&lt;<=
a href=3D"mailto:munoz0raul@gmail.com" target=3D"_blank">munoz0raul@gmail.c=
om</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div>I couldnt see this folders:</div><div><br></div><div>

<div>root@beaglebone:/lib/fir<div class=3D"gmail_default" style=3D"font-fam=
ily:&#39;courier new&#39;,monospace;font-size:small;display:inline">=E2=80=
=8Ban=E2=80=8B</div>mware# export SLOTS=3D/sys/devices/bone_capemgr.9/slots=
</div>
</div><div></div></blockquote></div><br><div class=3D"gmail_default" style=
=3D"font-family:&#39;courier new&#39;,monospace;font-size:small">=E2=80=8Bc=
=E2=80=8Ban you use the kernel from meta-beagleboard and check if you get c=
ape support=C2=A0</div>

<br></div></div>

--089e01176cadadee4c04f33464f3--
