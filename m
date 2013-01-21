Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7CA8E002AB
	for <meta-ti@yoctoproject.org>; Mon, 21 Jan 2013 10:30:26 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0LIULYq032411;
	Mon, 21 Jan 2013 12:30:22 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0LIUL4Y001765;
	Mon, 21 Jan 2013 12:30:21 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 21 Jan 2013 12:30:21 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r0LIULsf013852;
	Mon, 21 Jan 2013 12:30:21 -0600
Date: Mon, 21 Jan 2013 13:30:20 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130121183020.GA15396@edge>
References: <50FD1AC4.1050506@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <50FD1AC4.1050506@communistcode.co.uk>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: New KERNEL_CCSUFFIX
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
X-List-Received-Date: Mon, 21 Jan 2013 18:30:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 21, 2013 at 10:39:00AM +0000, Jack Mitchell wrote:
> Morning all,
> 
> With Khems recent 'kernel.bbclass, module-base.bbclass: Use CC to
> form KERNEL_CC' patch, it seems the kernel compile in meta-ti is now
> knackered.
> 
> I get the error message:
> 
> ERROR: Nothing PROVIDES
> 'virtual/arm-oecore-linux-gnueabi-gcc${KERNEL_CCSUFFIX}'
> 
> Which I guess is related to line 120 in multi-kernel.inc - I have
> tried to understand what the changes that Khem made are but it goes
> a bit above my comprehension level unfortunately. So I was wondering
> if anyone has a patch or any suggestions on how to get this going
> again?

Jack,

Thanks. I'm already looking into multi-kernel.inc due to other issues, so I'll 
try to fix this one as well. No ETA though... :)

-- 
Denys

