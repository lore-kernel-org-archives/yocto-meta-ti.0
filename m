Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D65D5E0127D
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 29 Jan 2012 23:55:04 -0800 (PST)
Received: by werb10 with SMTP id b10so3542092wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Sun, 29 Jan 2012 23:55:03 -0800 (PST)
Received: by 10.216.132.214 with SMTP id o64mr3169932wei.26.1327910103412;
	Sun, 29 Jan 2012 23:55:03 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fv6sm49757368wib.8.2012.01.29.23.55.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jan 2012 23:55:02 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 30 Jan 2012 08:54:59 +0100
Message-Id: <074F4B92-525B-408B-8C84-E3D6CB4B151E@dominion.thruhere.net>
References: <1327845060-30614-1-git-send-email-koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] u-boot 2011.12: fix beagleboard C4 memory detection
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
X-List-Received-Date: Mon, 30 Jan 2012 07:55:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 29 jan. 2012, om 14:51 heeft Koen Kooi het volgende geschreven:

> Test results (which emberassingly enough lack an actual C4):
> 
> BeagleBoard B6:
> 
> 	OMAP3530-GP ES2.1, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
> 	OMAP3 Beagle board + LPDDR/NAND
> 	I2C:   ready
> 	DRAM:  128 MiB
> 	NAND:  256 MiB
> 	[..]
> 	Beagle Rev Ax/Bx
> 
> BeagleBoard C3:
> 
> 	OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
> 	OMAP3 Beagle board + LPDDR/NAND
> 	I2C:   ready
> 	DRAM:  256 MiB
> 	NAND:  256 MiB
> 	[..]
> 	Beagle Rev C1/C2/C3
> 
> BeagleBoard C5:
> 
> 	OMAP3530-GP ES3.1, CPU-OPP2, L3-165MHz, Max CPU Clock 720 mHz
> 	OMAP3 Beagle board + LPDDR/NAND
> 	I2C:   ready
> 	DRAM:  256 MiB
> 	NAND:  512 MiB
> 	[..]
> 	Beagle Rev C4
> 

And now the big question: how should these be flashed to NAND?

