Return-Path: <schnitzeltony@gmx.de>
Received: from mailout-de.gmx.net (mailout-de.gmx.net [213.165.64.22])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6685DE00B0A
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 06:06:00 -0800 (PST)
Received: (qmail invoked by alias); 20 Jan 2012 14:05:57 -0000
Received: from p5B0A175F.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.23.95]
	by mail.gmx.net (mp070) with SMTP; 20 Jan 2012 15:05:57 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/11YBMKGP1yTodlUgUZBzfdU1nB2KjTO5+cEx98u
	XTE2bioswQY1BV
From: Andreas =?iso-8859-1?q?M=FCller?= <schnitzeltony@gmx.de>
To: meta-ti@yoctoproject.org
Date: Fri, 20 Jan 2012 15:07:23 +0100
User-Agent: KMail/1.13.7 (Linux/2.6.35.14-106.fc14.x86_64; KDE/4.6.5; x86_64; ;
	)
References: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
In-Reply-To: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201201201507.23879.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
Subject: Re: [RFC] u-boot recipe naming
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
X-List-Received-Date: Fri, 20 Jan 2012 14:06:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday, January 20, 2012 01:41:51 PM Koen Kooi wrote:
> Hi,
> 
> We currently have a problem with other layers including their own version
> of u-boot_2011.12.bb which confuses bitbake. To avoid such hassle in the
> future I'm going to propose using the kernel naming scheme for u-boot
> recipes as well:
> 
> u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
> u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
> u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches e.g.
> u-boot-psp-am18x_git.bb
> 
> This should avoid filename based conflicts between layers and make it
> clearer which tree the recipe will be building.
> 
> Thoughts/flames/opinions?
> 
> regards,
> 
> Koen
Additional: How about exceeding the u-boot.inc ( linux.inc too? ) filenames by 
the layer name they live in, so other layers don't need to copy & paste ( 
happend yesterday after meta-ettus fallout - know it is worked around now ).

Andreas

