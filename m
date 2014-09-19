Return-Path: <alexandre.belloni@free-electrons.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2E8EE0076C; Fri, 19 Sep 2014 01:00:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.free-electrons.com (top.free-electrons.com [176.31.233.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3DE2E006EF
	for <meta-ti@yoctoproject.org>; Fri, 19 Sep 2014 01:00:27 -0700 (PDT)
Received: by mail.free-electrons.com (Postfix, from userid 106)
	id DC4307BC; Fri, 19 Sep 2014 10:00:29 +0200 (CEST)
Received: from localhost (128-79-216-6.hfc.dyn.abo.bbox.fr [128.79.216.6])
	by mail.free-electrons.com (Postfix) with ESMTPSA id 974E76F3;
	Fri, 19 Sep 2014 10:00:29 +0200 (CEST)
Date: Fri, 19 Sep 2014 10:00:25 +0200
From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
To: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
Message-ID: <20140919080024.GE29620@piout.net>
References: <20140918133355.GC29620@piout.net>
	<2297605.6c1qGey1Tv@comp-006-thk>
MIME-Version: 1.0
In-Reply-To: <2297605.6c1qGey1Tv@comp-006-thk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: Creating am335x sdcard images with wic
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
X-List-Received-Date: Fri, 19 Sep 2014 08:00:33 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On 18/09/2014 at 23:46:02 +0200, Maciej Borzecki wrote :
> On Thursday 18 of September 2014 15:33:55 Alexandre Belloni wrote:
> > 1/ With wic, this is the command line to generate the FAT
> > filesystem:
> > 
> > mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C /var/tmp/wic/build/boot
> > 10240
> 
> With current master this line should look more like this:
> mkdosfs -F 16 -n boot -d /var/tmp/wic/build/boot -C 
> /var/tmp/wic/build/fs_boot.vfat 10240
> 
> What revision of poky do you use?
> 

I'm currently using daisy.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

