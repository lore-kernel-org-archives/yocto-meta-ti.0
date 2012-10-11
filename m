Return-Path: <ebutera@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F16BE00292
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:43:16 -0700 (PDT)
Received: by mail-vb0-f48.google.com with SMTP id e21so1840272vbm.35
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 03:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=ITNdpnR70aJkACtPRLkL9taINgE7y6Y3ef47dehoJb4=;
	b=aRq+z0/i/BeKD+GtyPOlKAJHckMBzPhRHVI80m58KbZ4WpDqsdzcFifWvRElcniauN
	yYpGCclAv1LURjlM6azu0gNB5hmqU4n9HazYOOPDqDzovfqiI5UbXTaxFrMlj0aA1FbS
	4dot77Cc/4wQtLu4xR8qd1iCDGBWXBybulT7f5jksYLHknTRuTqo16CP/XAmgdnXpZKY
	No9WgssbHQvDLAiK4EtGOrXEzSFvbYMcZJTwUVJv3Nv3+deexBFnUlTJoYOYmfNsNKO9
	FtBBh8FlayHSqCm8Rni7n/97wYScCccMFY65uw/FHvIBHxd3mUVS49pP7awSL365D83V
	hezA==
MIME-Version: 1.0
Received: by 10.58.231.8 with SMTP id tc8mr212507vec.52.1349952196035; Thu, 11
	Oct 2012 03:43:16 -0700 (PDT)
Sender: ebutera@gmail.com
Received: by 10.220.226.196 with HTTP; Thu, 11 Oct 2012 03:43:15 -0700 (PDT)
In-Reply-To: <CAOT3mi+4RSMhPhXP5KwuzE1C9eGorJXp=N=NnsxahxbWeS7Cvg@mail.gmail.com>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-2-git-send-email-ebutera@users.berlios.de>
	<CAOT3mi+4RSMhPhXP5KwuzE1C9eGorJXp=N=NnsxahxbWeS7Cvg@mail.gmail.com>
Date: Thu, 11 Oct 2012 12:43:15 +0200
X-Google-Sender-Auth: DrQp4-5YIYFcQu0ZTGu1Jz1pGdk
Message-ID: <CA+2YH7taGAPeNSNWYSWVG+bc_RULorDWtcFViNocDSBMtMyszg@mail.gmail.com>
From: Enrico <ebutera@users.berlios.de>
To: Nicolas Dechesne <ndec13@gmail.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 2/6] libdrm: enable omap experimental api support
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
X-List-Received-Date: Thu, 11 Oct 2012 10:43:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Oct 11, 2012 at 10:07 AM, Nicolas Dechesne <ndec13@gmail.com> wrote:
> On Thu, Oct 11, 2012 at 1:40 AM, Enrico Butera <ebutera@users.berlios.de> wrote:
>> +COMPATIBLE_MACHINE = "pandaboard"
>
> i am not familiar too much with all the features of bitbake... but it
> seems that 'omap4' should be better for the compatibility. our current
> position is to request all OMAP4 boards/customers to use libdrm with
> OMAP experiemental support, that the only config we (TI) actually
> support.
>
> at some point, I would be interested to see libdrm-omap +
> xf-video-omap being used on omap3 too.. but that's outside the scope
> of *this* patch!
>
> and if you want to be proactive, you can add "omap4,omap5", as that's
> what we support on omap5 too.

Actually i always wandered if omap4 could be used there, but since i
was testing only on pandaboard i used that.

I will change it into "omap4|omap5" then (in this recipe and all the
others but linux-omap4).

Enrico

