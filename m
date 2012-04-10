Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F72E0137D
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 06:28:44 -0700 (PDT)
Received: by werc1 with SMTP id c1so4255090wer.35
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 06:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yULlIPYMKPfHDJ/SqciIKWR/Bi4bHOIBwaruqgbdvhQ=;
	b=JKmGxKL+fQRsn/2pjV6iAMyHtVqF0g2iINdeiZtqoQue9w8264GiXdhHAv5F/zwdao
	moielx5npikChpVasZOgpLNyZr/ksBSaGS4jmad1ukxhEqK+fouTJKtz9Imn9O8OMGoH
	eDD024tHe+/DvtlMfjVl/TI7y1j8ac+WIm2IMOusMCX+xpEbFEaLQm7Udsd3EZvLLorP
	eJQPN12s+SCV85TmTpZ1wuusFuzM9OoDiRWa3Jpb0eXkUcaQa+LZ/8lorJ25UpvelapP
	v9jHy1itEYf422v+rKyrRzLC/MzpeZKbc84hTKZyMCA6eHohbGIFNDqmstdNtH9ankn0
	1JEw==
Received: by 10.180.24.7 with SMTP id q7mr7090762wif.11.1334064523753;
	Tue, 10 Apr 2012 06:28:43 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ff9sm37702987wib.2.2012.04.10.06.28.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 06:28:42 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1334063833-9235-1-git-send-email-eric@eukrea.com>
Date: Tue, 10 Apr 2012 15:28:41 +0200
Message-Id: <6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
References: <1334063833-9235-1-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnEWH5O4lmgewAQvGW4Y9gwjXP0J40kx6tbBjyzPYq2lvLHPLyGoFL3YSIL05HPe4dK7nzy
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-git: add COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 10 Apr 2012 13:28:45 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 apr. 2012, om 15:17 heeft Eric B=E9nard het volgende geschreven:

> so that an other BSP layer can also provide a u-boot_git recipe

ah right, we talked about this earlier and were going to namespace our =
uboot recipes instead. COMPATIBLE_MACHINE is just too dang hard to grasp =
for customers adding their machine.

Chase, Tom, any patches q'd to rename our uboots?

regards,

Koen=

