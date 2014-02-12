Return-Path: <diego.sueiro@gmail.com>
Received: from mail-qc0-f180.google.com (mail-qc0-f180.google.com
	[209.85.216.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E765EE0076C
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 07:42:51 -0800 (PST)
Received: by mail-qc0-f180.google.com with SMTP id i17so15841481qcy.11
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2014 07:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VRYsHbaEvMKZdQQWVHKLmnJUlItUKUJQYjjMq8Eu3Tc=;
	b=bNKonJ5eflLD5zltEChybCTCKYNk4XA8x2rRHcUzfYNr84IPnsoos/CRMlQDZydTQk
	w9FjDSdpAbVIxVPzmGYD0fSoKctQOmykFXtaGkkUvZ5ZOoLrqCMYvtAVKt8S7IIC9Ucx
	Bu+l+ViWdPODevCb5ZcpE9KX0ygcYRzmrnZ+bjcBGkb4FEnZFTA4nB36JPddqu3Z3oJN
	H+a+ZVt+tkVAcpRxiaq/QtGEua/89eHvJvQHjdSzF8Rq2T1x7DBlRWEM5OSx4ZIVhiq7
	gIb4uLRmUrhHLAGLecI5uydTUVoOcu+5yqdrwk96nHmhR37XcerQWFMDZ2b/SeWVDhht
	Rvsw==
X-Received: by 10.224.162.200 with SMTP id w8mr68943108qax.1.1392219770437;
	Wed, 12 Feb 2014 07:42:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.25.47 with HTTP; Wed, 12 Feb 2014 07:42:30 -0800 (PST)
In-Reply-To: <20140211164725.GN3131@edge>
References: <CAMCfZKFvf0oxesWZ54Yj8rthHCS0GTnO-znDBQ1=2M9g-tLUCQ@mail.gmail.com>
	<20140211144551.GF3131@edge>
	<CAMCfZKHbrQR_1Htcxv5Xgg43yoLTJTyzu8=4CpWiO9-meB1Z5A@mail.gmail.com>
	<20140211145214.GH3131@edge>
	<CAMCfZKFy-UYxZ+ENv0_U0ii+RLdScMthAPFhzK-2PhPZvg-3ZA@mail.gmail.com>
	<CAMCfZKFexQe8-WSy-43Gp=8Tks=y+i3hkWGmaLe5wdPAdQj89Q@mail.gmail.com>
	<20140211152805.GK3131@edge>
	<CAMCfZKH0ommWq09mrrnrPP2Yj-rgu97H2opdzzUYZM-B-Cy9Cw@mail.gmail.com>
	<20140211162752.GL3131@edge>
	<CAMCfZKHjb87g08+5fDDVqh3-5MWHoXPmwYsy294tND4=AN8HCA@mail.gmail.com>
	<20140211164725.GN3131@edge>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Wed, 12 Feb 2014 13:42:30 -0200
Message-ID: <CAMCfZKH2dEsd8=qihsETyA0-pdC08pX=o-SKyOKhvXqkVGy75w@mail.gmail.com>
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
X-List-Received-Date: Wed, 12 Feb 2014 15:42:53 -0000
Content-Type: multipart/alternative; boundary=089e01494846ddc8fb04f2376ca6

--089e01494846ddc8fb04f2376ca6
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 2:47 PM, Denys Dmytriyenko <denys@ti.com> wrote:

> Set DEFAULTTUNE in your distro or local config to one of the available
> values,
> like armv7athf-neon or cortexa8thf-neon etc.
>

Thanks,
It worked.

I's there a image recipe to test this module?

Regards,

--
*dS
Diego Sueiro

Administrador do Embarcados
www.embarcados.com.br

/*long live rock 'n roll*/

--089e01494846ddc8fb04f2376ca6
Content-Type: text/html; charset=ISO-8859-1

<div dir="ltr"><div class="gmail_extra"><br><div class="gmail_quote">On Tue, Feb 11, 2014 at 2:47 PM, Denys Dmytriyenko <span dir="ltr">&lt;<a href="mailto:denys@ti.com" target="_blank">denys@ti.com</a>&gt;</span> wrote:<br>



<blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div style="overflow:hidden">Set DEFAULTTUNE in your distro or local config to one of the available values,<br>

like armv7athf-neon or cortexa8thf-neon etc.</div></blockquote></div><br>Thanks,</div><div class="gmail_extra">It worked.</div><div class="gmail_extra"><br></div><div class="gmail_extra">I&#39;s there a image recipe to test this module?<br>

<br clear="all"><div><div dir="ltr"><div>Regards,</div><div><br>

</div>--<br>*dS<br>Diego Sueiro<br><br>Administrador do Embarcados<br><a href="http://www.embarcados.com.br" target="_blank">www.embarcados.com.br</a><br><br>/*long live rock &#39;n roll*/<br></div></div>
</div></div>

--089e01494846ddc8fb04f2376ca6--
