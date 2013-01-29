Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0776AE01400
	for <meta-ti@yoctoproject.org>; Tue, 29 Jan 2013 02:05:27 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:54945 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U084F-0007qw-5R
	for meta-ti@yoctoproject.org; Tue, 29 Jan 2013 05:05:27 -0500
Date: Tue, 29 Jan 2013 05:05:23 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301290502200.12960@oneiric>
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
Subject: is there a newer u-boot for omapl138?
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
X-List-Received-Date: Tue, 29 Jan 2013 10:05:28 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  just got me a pdlogic zoom am1808 experimenter kit:

http://www.logicpd.com/products/system-on-modules/zoom-am1808/

and building for am108x-evm, i notice the version of u-boot that's
pulled in is really pretty ancient:

SRC_URI_omapl138 = "git://arago-project.org/git/projects/u-boot-omapl1.git;protocol=http"
SRCREV_pn-${PN}_omapl138  = "5f16b8551b125f16cd8d58f278cb25b94272fd9f"
PV_omapl138      = "2009.11+${PR}+gitr${SRCREV}"

  is there any obstacle in trying to update the version of u-boot for
that particular board?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

