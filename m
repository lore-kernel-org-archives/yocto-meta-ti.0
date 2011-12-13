Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CB970E006DF
	for <meta-ti@yoctoproject.org>; Mon, 12 Dec 2011 17:42:38 -0800 (PST)
Received: (qmail invoked by alias); 13 Dec 2011 01:42:36 -0000
Received: from p5B0A2D4D.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.45.77]
	by mail.gmx.net (mp026) with SMTP; 13 Dec 2011 02:42:36 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/r3A1226vrlM+m7vNJQ1eZLdLxCqaOScPjtNjZlj
	Kv1rhYDF8j0+MP
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Tue, 13 Dec 2011 02:42:56 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <1322406218-8831-1-git-send-email-koen@dominion.thruhere.net>
	<201112130142.24576.schnitzeltony@gmx.de>
	<CA+M6bXm7w-JgO4XdVs+EYorTMU1AVFA37C5BKV72OundKA_g_w@mail.gmail.com>
In-Reply-To: <CA+M6bXm7w-JgO4XdVs+EYorTMU1AVFA37C5BKV72OundKA_g_w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201112130242.56955.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [PATCH 1/2] u-boot 2011.09: convert beagleboard to SPL build
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
X-List-Received-Date: Tue, 13 Dec 2011 01:42:39 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Party time! 

with


nand erase.chip
mmc rescan 0

# write MLO
fatload mmc 0 $loadaddr MLO
nandecc hw
nand write $loadaddr 0 ${filesize}

# write u-boot
fatload mmc 0 ${loadaddr} u-boot.img
nand write ${loadaddr} 80000 ${filesize}

# write the kernel
fatload mmc 0 ${loadaddr} uImage
nandecc sw
nand write ${loadaddr} 280000 ${filesize}


kernel boots from NAND ( kernel needs 'nandecc sw' !! )

Now is time for happy zzz..

Andreas

