Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61289E0044A
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:36:54 -0700 (PDT)
Received: by werc1 with SMTP id c1so5365620wer.35
	for <meta-ti@yoctoproject.org>; Tue, 17 Apr 2012 05:36:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1I+PHyG8/FxL5mlpI1J/kn743Qhon+ivEo20SUQ58ZQ=;
	b=JykN09570dLMr0QQQtwEGCM2tJL1VY0JRWwN1Um4gBc/mzPQLIjnqs4XmZiY1IAOro
	h6GFvVMlZ3JNRi6uFjlgTjxQ4cukvbaF3Y7wrAUJupx4ABiQCKkuqLkobjHXRwnRw/T5
	4rShMUcosxyne5A92QWr/dJYe1BBjLfQjZsDG2cdGXc/e1WSH6t8zbqEUPJgw5KbgcKE
	Hd7YRKVduiuNqdUVcZHfmO6owz8HnfxmHVb6LDloCf33wcta886jjGkOQoV4D5wA33gp
	jyg2/ibjrPOYIDkMY1LoB+VQmrFMa/Lt3xq0NZW8IR85qddzyP9LCZyn2r0pTGgeVay9
	EFTQ==
Received: by 10.180.103.35 with SMTP id ft3mr28023411wib.0.1334666212185;
	Tue, 17 Apr 2012 05:36:52 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm27165837wis.0.2012.04.17.05.36.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 05:36:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120417142129.42cd2a67@eb-e6520>
Date: Tue, 17 Apr 2012 14:36:49 +0200
Message-Id: <55674C9F-D066-4072-BCBB-DF2574127E33@dominion.thruhere.net>
References: <20120417142129.42cd2a67@eb-e6520>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnyIaRgRJ4E2fr4kC1V2xEo5p+nYp3zjtHR2QLG/BAR0HXTDS5gTXExBoGLc4w2iUnnztKn
Cc: meta-ti@yoctoproject.org
Subject: Re: Pandaboard & meta-ti
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
X-List-Received-Date: Tue, 17 Apr 2012 12:36:54 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 14:21 heeft Eric B=E9nard het volgende geschreven:

> Hi,
>=20
> I've tried to build a xfce-nm-image for a Pandaboard (ES in the =
present
> case) and it boots fine with the generated MLO, u-boot & uImage but I
> don't manage to get a video output on both HDMI connectors : is there
> something special to do here ?
> (Same thing with systemd-image : I don't get any framebuffer output)

Try booting with a monitor attached to a port, the EDID probe should =
pick it up.

> Also, it seems that the sdcard_image failed to build : is there a
> specific setting to get the sdcard_image for Pandaboard which would
> avoid to have to manually create the SDCard's partitions ?

Not sure, I never tried to use that class for pandaboard :)

> Last question : why does conf/machine/include/omap4.inc require
> conf/machine/include/tune-cortexa8.inc instead of tune-cortexa9 ?

There's no real benefit from using A9 tunefiles over the A8 ones, but =
changing it shouldn't hurt.

regards,

Koen=

