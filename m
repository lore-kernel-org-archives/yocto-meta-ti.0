Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DEE7E00799; Tue, 12 Aug 2014 08:52:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 977B1E006EF
	for <meta-ti@yoctoproject.org>; Tue, 12 Aug 2014 08:52:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7CFqmZC001865;
	Tue, 12 Aug 2014 10:52:48 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFql8x005880;
	Tue, 12 Aug 2014 10:52:48 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 12 Aug 2014 10:52:47 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7CFqlXA025937;
	Tue, 12 Aug 2014 10:52:47 -0500
Date: Tue, 12 Aug 2014 11:52:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Lee <eric.lee@embedian.com>
Message-ID: <20140812155246.GH23523@edge>
References: <000001cfb5fb$1cafdd60$560f9820$@embedian.com>
MIME-Version: 1.0
In-Reply-To: <000001cfb5fb$1cafdd60$560f9820$@embedian.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: cryptodev build error with 3.15.y
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
X-List-Received-Date: Tue, 12 Aug 2014 15:52:50 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 12, 2014 at 03:00:22PM +0800, Eric Lee wrote:
> Hi Denys,
> 
> I built TI SDK7 with Linux kernel 3.15.y and got cryptodev compile error. I
> knew that you have a fix for this. May I know where can I find your fix?
> Thanks.

There were no releases with 3.15 kernel. The one we have working is 3.14 now.

What is the compile error you are getting?

-- 
Denys

