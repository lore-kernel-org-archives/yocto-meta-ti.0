Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3386E00B0A
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 04:42:00 -0800 (PST)
Received: by wgbdq10 with SMTP id dq10so447814wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 04:41:59 -0800 (PST)
Received: by 10.180.109.198 with SMTP id hu6mr3523901wib.16.1327063319530;
	Fri, 20 Jan 2012 04:41:59 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm3072713wib.3.2012.01.20.04.41.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 04:41:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 20 Jan 2012 13:41:51 +0100
To: meta-ti@yoctoproject.org
Message-Id: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
X-Mailer: Apple Mail (2.1251.1)
Subject: [RFC] u-boot recipe naming
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
X-List-Received-Date: Fri, 20 Jan 2012 12:42:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

We currently have a problem with other layers including their own =
version of u-boot_2011.12.bb which confuses bitbake. To avoid such =
hassle in the future I'm going to propose using the kernel naming scheme =
for u-boot recipes as well:

u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches e.g. =
u-boot-psp-am18x_git.bb

This should avoid filename based conflicts between layers and make it =
clearer which tree the recipe will be building.

Thoughts/flames/opinions?

regards,

Koen=

