Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6804E0027B
	for <meta-ti@yoctoproject.org>; Tue, 31 Jul 2012 13:16:27 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6VKGRoi004928;
	Tue, 31 Jul 2012 15:16:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6VKGQAe012106;
	Tue, 31 Jul 2012 15:16:26 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 31 Jul 2012 15:16:26 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6VKGQq8022340;
	Tue, 31 Jul 2012 15:16:26 -0500
Date: Tue, 31 Jul 2012 16:16:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
Message-ID: <20120731201625.GC21245@edge>
References: <5007E1FE.3070208@mentor.com>
MIME-Version: 1.0
In-Reply-To: <5007E1FE.3070208@mentor.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: linux-omap-psp and security code
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
X-List-Received-Date: Tue, 31 Jul 2012 20:16:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This one got stuck in the moderation queue with all the spam... Just wanted to 
comment on the third option, though.

On Thu, Jul 19, 2012 at 01:31:26PM +0300, Vladimir Zapolskiy wrote:
> One more option is to fix the patch, either remove store feature of
> /sys/devices/system/cpu/cpuN/(l2_)?aux_control files or provide
> -march=armv7-a+sec AFLAGS in Makefile.

FWIW, I previously made a similar fix for this type of issue:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=051482e3b03ba7e2d6cecc0d8f85cc3be22dc8b2

But either way it's better to update to a more recent 2.6.37 kernel for AM37x 
anyway, which I'll work on next.

-- 
Denys

