Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D7FD0E00515
	for <meta-ti@yoctoproject.org>; Fri, 25 Jan 2013 06:03:26 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:52709 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1TyjsM-0001Km-5F
	for meta-ti@yoctoproject.org; Fri, 25 Jan 2013 09:03:26 -0500
Date: Fri, 25 Jan 2013 09:03:22 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301250900140.28247@oneiric>
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
Subject: some redundant recipes in ti-hw-bringup-image.bb b/c of packagegroup-ti-test.bb
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
X-List-Received-Date: Fri, 25 Jan 2013 14:03:27 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  it appears that the recipe list in ti-hw-bringup-image.bb:

IMAGE_INSTALL += " \
        usbutils \
        i2c-tools \
        alsa-utils \
        devmem2 \
        iw \
        bonnie++ \
        hdparm \
        iozone3 \
        iperf \
        lmbench \
        rt-tests \
        evtest \
        bc \
        packagegroup-ti-test \
        kernel-modules \
        ${EXTRA_MACHINE_IMAGE_INSTALL} \
"

has superfluous entries given the contents of packagegroup-ti-test.bb:

TEST = "\
    bonnie++ \
    hdparm \
    iozone3 \
    iperf \
    lmbench \
    rt-tests \
    "

TI_TEST = "\
    ltp-ddt \
    "

RDEPENDS_${PN} = "\
    ${TEST} \
    ${TI_TEST} \
    "

  am i reading that correctly, that about a half dozen packages listed
in the image recipe file are redundant?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

