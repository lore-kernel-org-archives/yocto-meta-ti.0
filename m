Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CC4F8E01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 12:49:48 -0800 (PST)
Received: from cpebcc8100fb8db-cmbcc8100fb8d8.cpe.net.cable.rogers.com
	([174.116.196.46]:38489 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TaulP-0001Lx-VO; Tue, 20 Nov 2012 15:49:48 -0500
Date: Tue, 20 Nov 2012 15:49:45 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Nicolas Dechesne <ndec13@gmail.com>
In-Reply-To: <CAOT3miKf4+VAc8cVRRd0-xoHosXBf0xJ38Sb5-cDST0JcriAzw@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1211201549030.3482@oneiric>
References: <alpine.DEB.2.02.1211201419330.18808@oneiric>
	<CAOT3miKf4+VAc8cVRRd0-xoHosXBf0xJ38Sb5-cDST0JcriAzw@mail.gmail.com>
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
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: there *is* no libdrm_2.4.39 in oe-core anymore, it's now 2.4.40
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
X-List-Received-Date: Tue, 20 Nov 2012 20:49:49 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Tue, 20 Nov 2012, Nicolas Dechesne wrote:

> Yes. That is what i reported earlier today. And that's why we
> discussed that we need to create the danny branch in meta-ti since
> danny still uses libdrm 2.39.
>
> Once we create danny branch we can revert the libdrm bbappend commit
> in master (and xf86-video-omap as well since it was merged in
> oe-core too)

  ah, sorry, i must have missed that.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

