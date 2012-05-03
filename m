Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 08D10E00723
	for <meta-ti@yoctoproject.org>; Wed,  2 May 2012 23:02:01 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so1127272wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 02 May 2012 23:02:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=evLFldDt7Yh0vEtfn0/X2YjyBc3yC64An3baQp/lsog=;
	b=aieXh/nfszU0uLxChGweUFwHWi1v4cM+FPvA0HIlTynPkP1pSddGxQS8OMaZ+GQxtS
	TZqMUMlMcwyL0yCMybtZmENEzOSUkuPePfcF82WbsxEJzn4mI0QXYWqmowOem0xQXXa9
	+L3ee0zL5sRUHFeMN4lArIVOLhQw7Wc7Zm2TSJQu31XprH0rhIUoRVT8snpUIs30iAk1
	OpdlzYjkq9BYsu4uVu5Dh3mYo1FKBS4OB7w3z2xd4qRFl5YmduHVtS31WnwBg57Ydy4w
	M47OeqIeDMgi2l5nM2QkdyHCRXLfTMdT5VkxzwpP9w/xdFn2mnd1kRJB3DZ+KbRUXHpZ
	feFg==
Received: by 10.180.78.9 with SMTP id x9mr2265968wiw.18.1336024920424;
	Wed, 02 May 2012 23:02:00 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o2sm14976651wiv.11.2012.05.02.23.01.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 23:01:59 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120503004302.E49A252A70@arago-project.org>
Date: Thu, 3 May 2012 08:02:00 +0200
Message-Id: <1DB7C838-80AE-47B8-9251-87253476B6F5@dominion.thruhere.net>
References: <20120503004302.E49A252A70@arago-project.org>
To: Arago Project git <git@arago-project.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk3AXMXqnnGFDpFpi6enaSllNBf+W/boftguifU1QyelIOUg61A7dpQKdFVhCa/4JYg1X1Z
Cc: meta-ti@yoctoproject.org
Subject: Re: Denys Dmytriyenko : beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils
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
X-List-Received-Date: Thu, 03 May 2012 06:02:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 mei 2012, om 02:43 heeft Arago Project git het volgende geschreven:

> Module: meta-ti
> Branch: master
> Commit: 3c693c26087aa148b944166083b5336f05d1c15b
> URL:    =
http://arago-project.org/git/meta-ti.git?a=3Dcommit;h=3D3c693c26087aa148b9=
44166083b5336f05d1c15b
>=20
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Wed May  2 20:40:58 2012 -0400
>=20
> beaglebone: disable THUMB2_KERNEL in defconfig for newer binutils


Wait, what? Can we actually send these changes for review first? T2 is =
needed to meet the boot time goal, so please revert this one!=

