Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2CDCBE006C3
	for <meta-ti@yoctoproject.org>; Mon, 28 Jan 2013 14:20:55 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:51755 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1Tzx4P-0006SI-Jb
	for meta-ti@yoctoproject.org; Mon, 28 Jan 2013 17:20:53 -0500
Date: Mon, 28 Jan 2013 17:20:50 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301281719080.9332@oneiric>
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
Subject: any need to keep specifying u-boot as preferred bootloader?
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
X-List-Received-Date: Mon, 28 Jan 2013 22:20:55 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


$ grep -r "PREFERRED.*bootloader" *
conf/machine/am37x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/am180x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/am3517-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/omap3evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/include/ti814x.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/include/davinci.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/include/omap4.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/include/ti816x.inc:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
conf/machine/am335x-evm.conf:PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
$

  while it doesn't hurt, of course, any overwhelming need to repeat
the same thing?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

