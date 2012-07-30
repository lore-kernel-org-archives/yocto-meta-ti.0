Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F165FE0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 15:19:20 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6UMJIim003923;
	Mon, 30 Jul 2012 17:19:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6UMJIj8021825;
	Mon, 30 Jul 2012 17:19:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 30 Jul 2012 17:19:18 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6UMJIbT017573;
	Mon, 30 Jul 2012 17:19:18 -0500
Date: Mon, 30 Jul 2012 18:19:18 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: maniacbug <maniacbug@ymail.com>
Message-ID: <20120730221917.GC23003@edge>
References: <1342988124.95264.YahooMailNeo@web121603.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1342988124.95264.YahooMailNeo@web121603.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Yocto on Pandaboard FTW
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
X-List-Received-Date: Mon, 30 Jul 2012 22:19:21 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Jul 22, 2012 at 01:15:24PM -0700, maniacbug wrote:
> Hi. Just wanted to say that I received my Pandaboard A4 in the mail 
> yesterday, and this morning core-image-minimal and core-image-sato are 
> running great, using the following configuration.
> 
> OE Build Configuration:
> BB_VERSION        = "1.15.1"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "pandaboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.2"
> TUNE_FEATURES     = "armv7a vfp neon cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta              
> meta-yocto        = "master:cda59a9fb77544c85410cc6192e37e7c8d4c6e44"
> meta-ti           = "(nobranch):30fb40ebc13614a74c2e237927c60ac43e01d1bc"
> 
> Sato came up great on my 7-inch 1280x720 display, and I've spent 30 minutes 
> playing 'bridges' :)

Sorry for not replying earlier - just wanted to thank you for bringing the 
good news! :)

> I noticed in earlier postings that using meta-ti and poky together is still 
> somewhat new or under development. Is there anything I should test or try 
> out to help the effort along?

Just keep in mind, that support for Pandaboard in meta-ti falls under the 
"best effort" category, since its kernel is being pulled from Ubuntu-based 
product and adapted to OE/Yocto. Don't get discouraged if something is broken 
or is not fully supported. And of course, patches are always welcome! :)

-- 
Denys

