Return-Path: <otavio.salvador@gmail.com>
Received: from mail-lpp01m010-f48.google.com (mail-lpp01m010-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A6F8E0030B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:16:00 -0800 (PST)
Received: by lagw12 with SMTP id w12so28105lag.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=++lcIQjp+ShKXFFrk4e9JeqpDNinC3EaVOQeKBuqHhY=;
	b=E8yjqDbe2T6XcNRFL6+PPbGdhuAwGk7eiNoOOCF9tVH8gVIFDPeRG757DzPNg1V6rh
	vNbzaCs6liIBc30YgwYv/FtWmJAP0dsenkNzNxpjdwUG7BzxrjOeneGbq80t9d9hdvSa
	yDI/3Go8dWAS0rhWmGQh6b+UxbxqQA8DVxXUY=
MIME-Version: 1.0
Received: by 10.112.36.34 with SMTP id n2mr3195013lbj.24.1328012159238; Tue,
	31 Jan 2012 04:15:59 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.112.46.199 with HTTP; Tue, 31 Jan 2012 04:15:59 -0800 (PST)
In-Reply-To: <20120131004439.GF2032@denix.org>
References: <20120131004439.GF2032@denix.org>
Date: Tue, 31 Jan 2012 10:15:59 -0200
X-Google-Sender-Auth: neHmm0pQ-G2248MYKTfExOBSCA4
Message-ID: <CAP9ODKpqy29_dW30Qb8xQfgcU6A1aqsh_9x8tNEHAFqh_vOoOg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: meta-ti layer split
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2012 12:16:01 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe34ec02425504b7d1eded

--e0cb4efe34ec02425504b7d1eded
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jan 30, 2012 at 22:44, Denys Dmytriyenko <denis@denix.org> wrote:

> After much debate and further considerations ;) we've decided to split
> meta-ti
> repository into 2 layers to ease up on inter-layer dependencies and to
> enable
> additional use cases of building basic BSP images with a very small set of
> layers, only requiring oe-core as a dependency. The proposed split is the
> following:
>
> 1. meta-ti-bsp-core - is the ultra portable layer.  Starting out it will
> contain only recipes-kernel and recipes-bootloader plus necessary machine
> configurations. Depending on the platform, can be as little as basic board
> support.
>
> 2. meta-ti-bsp-extras - provides the full chip functions with perhaps some
> extra constraints. Initialy this will contian support for DSP, Graphics,
> and
> Wifi. Provides additional board support for peripherals that may require
> software components like DSPBIOS, CodecEngine, gst-ti, firmware etc.
> Depends
> on meta-ti-bsp-core. In the future, if certain technologies prove
> themselves
> well portable, we may move them from meta-ti-bsp-extras to
> meta-ti-bsp-core.
>
> I'll be starting the initial work on this in a separate branch, calling for
> wider review once ready.
>
> Please provide feedback. Thanks.


I don't like the idea. In my POV what is not compatible with OE-Core might
be moved to a meta-ti-extras, no problem, but making a meta-ti-bsp-core
seems too restrictive and I see not many people end using only it in the
end.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e0cb4efe34ec02425504b7d1eded
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Mon, Jan 30, 2012 at 22:44, Denys Dmytriyenko=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org">denis@denix.org</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
After much debate and further considerations ;) we&#39;ve decided to split =
meta-ti<br>
repository into 2 layers to ease up on inter-layer dependencies and to enab=
le<br>
additional use cases of building basic BSP images with a very small set of<=
br>
layers, only requiring oe-core as a dependency. The proposed split is the<b=
r>
following:<br>
<br>
1. meta-ti-bsp-core - is the ultra portable layer. =A0Starting out it will<=
br>
contain only recipes-kernel and recipes-bootloader plus necessary machine<b=
r>
configurations. Depending on the platform, can be as little as basic board<=
br>
support.<br>
<br>
2. meta-ti-bsp-extras - provides the full chip functions with perhaps some<=
br>
extra constraints. Initialy this will contian support for DSP, Graphics, an=
d<br>
Wifi. Provides additional board support for peripherals that may require<br=
>
software components like DSPBIOS, CodecEngine, gst-ti, firmware etc. Depend=
s<br>
on meta-ti-bsp-core. In the future, if certain technologies prove themselve=
s<br>
well portable, we may move them from meta-ti-bsp-extras to meta-ti-bsp-core=
.<br>
<br>
I&#39;ll be starting the initial work on this in a separate branch, calling=
 for<br>
wider review once ready.<br>
<br>
Please provide feedback. Thanks.</blockquote><div><br></div><div>I don&#39;=
t like the idea. In my POV what is not compatible with OE-Core might be mov=
ed to a meta-ti-extras, no problem, but making a meta-ti-bsp-core seems too=
 restrictive and I see not many people end using only it in the end.</div>
<div>=A0</div></div>-- <br>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio=
@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=
=3D"http://www.ossystems.com.br" target=3D"_blank">http://www.ossystems.com=
.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>

--e0cb4efe34ec02425504b7d1eded--
