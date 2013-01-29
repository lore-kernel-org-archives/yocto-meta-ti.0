Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EF62E01400
	for <meta-ti@yoctoproject.org>; Tue, 29 Jan 2013 02:19:27 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:55112 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U08Hm-0008AN-DZ
	for meta-ti@yoctoproject.org; Tue, 29 Jan 2013 05:19:26 -0500
Date: Tue, 29 Jan 2013 05:19:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301290514420.13116@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: removing vestiges of references to FILESPATHPKG
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
X-List-Received-Date: Tue, 29 Jan 2013 10:19:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  another pedantic observation -- according to
http://www.openembedded.org/wiki/Migrating_metadata_to_OE-Core:

"Use FILESEXTRAPATHS to extend file search path: Modifications to
FILESPATHPKG and/or FILESPATH should be replaced by prepending to
FILESEXTRAPATHS;..."

$ grep -r FILESPATHPKG *
recipes-bsp/x-load/x-load_git.bb:#FILESPATHPKG_prepend = "x-load-git:x-load-git/${MACHINE}"
recipes-bsp/u-boot/u-boot_2010.06-psp.bb:FILESPATHPKG =. "u-boot-psp-git:"
recipes-bsp/u-boot/u-boot_git.bb:FILESPATHPKG =. "u-boot-git:"
recipes-kernel/linux/linux-omap_2.6.37.bb:FILESPATHPKG_prepend = "linux-omap-2.6.37:"
recipes-kernel/linux/linux-omap_2.6.39.bb:FILESPATHPKG_prepend = "linux-omap-2.6.39:"
$

  in any event, some of those references don't even look right -- for
example, there is no directory "u-boot-git" so it's not clear what
effect that middle line even has these days.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

