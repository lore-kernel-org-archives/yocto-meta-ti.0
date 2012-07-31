Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E50BCE0027B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 13:08:17 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6VK8B8Z030316;
	Tue, 31 Jul 2012 15:08:11 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6VK8BgN005316;
	Tue, 31 Jul 2012 15:08:11 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 31 Jul 2012 15:08:11 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6VK8BpY019917;
	Tue, 31 Jul 2012 15:08:11 -0500
Date: Tue, 31 Jul 2012 16:08:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ali Sayed <supernova_7072@yahoo.com>
Message-ID: <20120731200809.GA21245@edge>
References: <1341862758.65710.YahooMailNeo@web120202.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1341862758.65710.YahooMailNeo@web120202.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: ExpansionError during parsing
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
X-List-Received-Date: Tue, 31 Jul 2012 20:08:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 09, 2012 at 12:39:18PM -0700, Ali Sayed wrote:
> ERROR: ExpansionError during parsing 
> /yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb: 
> Failure expanding variable FILESPATH, expression was ${@base_set_filespath([ 
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00-${MACHINE_KERNEL_PR}a", 
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00",
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530",
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530-4_00_00_00",
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/ti-codecs-omap3530",
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine/files", 
> "/yocto/boards/beagle/poky/meta-ti/recipes-ti/codec-engine" ], d)} which 
> triggered exception SyntaxError: EOL while scanning string literal 
> (FILESPATH, line 1)
> 
> I have this error when I tried to build an Angstrom image for beagle board.

Hmm, I don't think the above is the correct Angstrom configuration. Looks more 
like the Poky one...

Can you show us your bblayers.conf?


> I tried to add this line
> BBMASK = ".*/meta-ti/recipes-misc/"
> to conf/local.conf file , but the error still there.
> also I saw this :https://lists.yoctoproject.org/pipermail/meta-ti/2012-June/001279.html
> but my linux.inc is already hasn't require linux-tools.inc

-- 
Denys

