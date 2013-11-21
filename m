Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-ob0-f171.google.com (mail-ob0-f171.google.com
	[209.85.214.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C13C3E0059E
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 03:17:17 -0800 (PST)
Received: by mail-ob0-f171.google.com with SMTP id wp18so6963862obc.16
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 03:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=6xi5rptlFIbSMV96T7Fcw2pjGzDafP4NxZcNh7BvH1M=;
	b=dMGi3G15XLNtwZ43ONJ9MucjfHfrCiYZEkWr4jZy90KEATXJxpSK9CU1B0ojP8uPEm
	sQhzgaziegSmyI/bCiX31d1ltNjQesF1IKy338iwsh4wrpOFEiKJvZ2W7PaIdj7JbNLN
	5n2FN/QX7FRHejspyHTNIZlS6U6YyV6NP38sbrCFkt6Z6iQfYhnaG31iX2UGr6BIfXQo
	No43r8ShJ6sORs5en80fowiAa+0HbaoaUHF0h8kyGKbxN5P1Gw5GI6W2rhMgqX6vbSzm
	gLKQa9ghd8JIvAWcPkzxCf04yjCKyv1xsV6pX2qNIr7A/cP5NTTSd0BBVuNVGcLues7n
	RXfA==
X-Gm-Message-State: ALoCoQlXB8xwoWEdOuydH/Sw7xKo+pSkt8T0y3r3PNIKezWLdq48/5fRPfE67hyHMf7xfIO4uxQW
X-Received: by 10.182.109.230 with SMTP id hv6mr244809obb.68.1385032636273;
	Thu, 21 Nov 2013 03:17:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.156.40 with HTTP; Thu, 21 Nov 2013 03:16:56 -0800 (PST)
In-Reply-To: <CAOMiE0npnVX_MgFMGNPKkoyQWyUm2Otp0Mu4U7-AH_jGRqh_mg@mail.gmail.com>
References: <CAOMiE0npnVX_MgFMGNPKkoyQWyUm2Otp0Mu4U7-AH_jGRqh_mg@mail.gmail.com>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Thu, 21 Nov 2013 12:16:56 +0100
Message-ID: <CAP71WjzMJbwQLkYMErQM5k1=Esh337t6yMe0o6R=kTcNq0QCuA@mail.gmail.com>
To: tom alex <tomalex333@gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: X11 configuration in pandaboard
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
X-List-Received-Date: Thu, 21 Nov 2013 11:17:18 -0000
Content-Type: multipart/alternative; boundary=001a11c31b4e49abcb04ebae0a72

--001a11c31b4e49abcb04ebae0a72
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 21, 2013 at 10:54 AM, tom alex <tomalex333@gmail.com> wrote:

> Failed to load module "omap_pvr" (module does not exist, 0)
>
> I am using the kernel version 3.4.11, From the Xorg log I come to know
> that X org uses soft EXA mode (not PVR mode). Aslo I found that
> omap_pvr_drv.so file is missing in /usr/xorg/modules/driver/ path. For your
> reference I have attached the X log.
>
> How can I enable PVR EXA mode ?
>
this module is provided by the PVR driver, and there is no PVR driver for
OMAP4 in meta-ti. xf86-video-omap is the open source X11 video driver for
OMAP that will work with or without PVR driver. Without PVR driver h/w EXA
will be disabled.

--001a11c31b4e49abcb04ebae0a72
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Thu, Nov 21, 2013 at 10:54 AM, tom alex <span dir=3D"ltr">&lt;<a href=3D=
"mailto:tomalex333@gmail.com" target=3D"_blank">tomalex333@gmail.com</a>&gt=
;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><p>Failed to load module &quot;omap_pvr&quot=
; (module does not exist, 0)<br></p><p>I am using the kernel version 3.4.11=
, From the Xorg log I come to=20
know that X org uses soft EXA mode (not PVR mode). Aslo I found that=20
omap_pvr_drv.so file is missing in /usr/xorg/modules/driver/ path. For=20
your reference I have attached the X log. <br></p><p>How can I enable PVR E=
XA mode ?</p></blockquote></div>this module is provided by the PVR driver, =
and there is no PVR driver for OMAP4 in meta-ti. xf86-video-omap is the ope=
n source X11 video driver for OMAP that will work with or without PVR drive=
r. Without PVR driver h/w EXA will be disabled.</div>

</div>

--001a11c31b4e49abcb04ebae0a72--
