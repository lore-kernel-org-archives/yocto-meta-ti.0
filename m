Return-Path: <ebutera@gmail.com>
Received: from mail-vx0-f176.google.com (mail-vx0-f176.google.com
	[209.85.220.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6DC4EE011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 04:16:38 -0700 (PDT)
Received: by vcbfl17 with SMTP id fl17so4560166vcb.35
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 04:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=7I4/1T+bJagETfvIpkiRC2ayponO+YndjRmlFCv+Z6o=;
	b=lQRZj/t6IDbKCzzobt5YwHQ5hbfSPfXoej8Swam6YNHWTk1aexEuMWp4wQjJkg++JJ
	hm6BfqHQTNVYVDOHHSDDK3B1zbAkXCCrrHHGp3kI0lWG55pZ7ZIBjdAiEE9Tkxa7v93d
	sAXDfdodwr3H2xoWDIs9q10fsM4QMwOyfrk0XA4YkvvzDcBQa3b7ScKE30zfLWvRGccW
	4roUSUGYloiaOf8bzZnU7jwW6suHYhGNBS25vCCdh5bIe84YAgg1FDobwmzOgb11MTrN
	esGc+ZB/UOMY/0p2ChN1hqC0RdGWPx1I5d1+QAl09W53DjuOMKHM+emoAGIPjWUSF37S
	DJJQ==
MIME-Version: 1.0
Received: by 10.52.76.164 with SMTP id l4mr4409538vdw.6.1331810197424; Thu, 15
	Mar 2012 04:16:37 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.157.70 with HTTP; Thu, 15 Mar 2012 04:16:37 -0700 (PDT)
In-Reply-To: <CAGiJk9fOyxDASHkFR_VFzYfgoKke0rkFhSavfRGRenNgstzvVA@mail.gmail.com>
References: <CAGiJk9e8hi80AB4R6+E8TgmosYXFx=y768oOah3S++w=zKthZg@mail.gmail.com>
	<CAGiJk9fOyxDASHkFR_VFzYfgoKke0rkFhSavfRGRenNgstzvVA@mail.gmail.com>
Date: Thu, 15 Mar 2012 12:16:37 +0100
X-Google-Sender-Auth: VFeqn88F0fKppWDvRa-38Y2JzHA
Message-ID: <CA+2YH7uG3VPmJ1GW_Wdo6unAKxw8c-LiT8wMEBRSvkBSsb3xfA@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: OpenGL ES on OMAP 3530
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
X-List-Received-Date: Thu, 15 Mar 2012 11:16:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 15, 2012 at 8:51 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> Hi,
>
> currently I've been trying to get the OpenGL ES drivers working on a
> Gumstix Overo.
> Building the recipe works without problems, but running any examples
> or demo applications that ship with the driver won't work.

in recipes-bsp/powervr-drivers/omap3-sgx-modules_4.05.00.03.bb try to
change the line:

TI_PLATFORM_omap3 = "omap3630"

that's for the dm3730, i can't remember right now what i used (maybe
omap3530 or 3430) but you can find out from the Makefile.

Enrico

