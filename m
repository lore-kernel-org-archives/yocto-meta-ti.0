Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28E1DE00404
	for <meta-ti@yoctoproject.org>; Fri,  9 Aug 2013 16:22:44 -0700 (PDT)
Received: from [174.115.226.96] (port=45237 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1V7w14-0002kx-IG
	for meta-ti@yoctoproject.org; Fri, 09 Aug 2013 19:22:42 -0400
Date: Fri, 9 Aug 2013 19:22:39 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1308091920590.10592@oneiric>
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
Subject: should mesa_9.1.5.bbappend be upgraded to 9.1.6?
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
X-List-Received-Date: Fri, 09 Aug 2013 23:22:47 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  trying to build for beaglebone, getting:

ERROR: No recipes available for:
/home/rpjday/oe/dist/layers/meta-ti/recipes-graphics/mesa/mesa_9.1.5.bbappend
ERROR: Command execution failed: Exited with 1

should meta-ti master stay in sync with oe-core master (which has a
recipe for 9.1.6), or is there a different combo of layers to use?
thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

