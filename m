Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E24DE01749
	for <meta-ti@yoctoproject.org>; Sun, 10 Nov 2013 09:47:33 -0800 (PST)
Received: from [173.34.6.101] (port=34765 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1VfZ6i-0005N5-Dq
	for meta-ti@yoctoproject.org; Sun, 10 Nov 2013 12:47:32 -0500
Date: Sun, 10 Nov 2013 12:47:24 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1311101239330.2907@oneiric>
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
Subject: puzzled by FILESPATH setting in tipspkernel.inc
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
X-List-Received-Date: Sun, 10 Nov 2013 17:47:38 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  poking around some of the kernel recipes in the meta-ti layer and
i'm a bit baffled by the following in
meta-ti/recipes-kernel/linux/tipspkernel.inc:

# First of all, set own FILESPATH avoiding unnecessary BP and BPN, but adding
# extra level of major version
FILESPATH = "${@base_set_filespath([ "${FILE_DIRNAME}/${PF}", "${FILE_DIRNAME}/${P}", "${FILE_DIRNAME}/${PN}-${PMV}", \
"${FILE_DIRNAME}/${PN}", "${FILE_DIRNAME}/files", "${FILE_DIRNAME}" ], d)}"

  i understand the mechanics of how the above works, but i'm not sure
about that very last element in array: ${FILE_DIRNAME}, all by itself.
is that deliberate? that is, not having any extra level such as ${PF}
or ${P} or "files"? isn't that suggesting that files can be located in
the main directory itself? which doesn't seem to be necessary.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

