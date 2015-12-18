Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DAB83E00AB9; Fri, 18 Dec 2015 13:01:06 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 369AEE00406
	for <meta-ti@yoctoproject.org>; Fri, 18 Dec 2015 13:01:05 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBIL13rG021046;
	Fri, 18 Dec 2015 15:01:03 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBIL13LC005664;
	Fri, 18 Dec 2015 15:01:03 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Dec 2015 15:01:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBIL114s030595;
	Fri, 18 Dec 2015 15:01:02 -0600
Date: Fri, 18 Dec 2015 16:00:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Aymeric Dumaz <aymeric.dumaz@gmail.com>
Message-ID: <20151218210044.GW27464@edge>
References: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAESSzZwLDR3AkL=f8n5J6Qs2B4wmy66S3HA58Sbuz2qPvxYp8Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Fido doesn't boot on OMAP5 EVM, and HDMI errors for BB X15
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
X-List-Received-Date: Fri, 18 Dec 2015 21:01:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Dec 17, 2015 at 05:19:39PM -0800, Aymeric Dumaz wrote:
> Hello,
> 
> I tried to build a Fido core-image-minimal for the OMAP5 EVM and BB X15.
> 
> On the OMAP5432 uEVM, nothing happens after "Starting kernel", there
> is no log and the HDMI screen doesn't show the Arago prompt.
> Adding the earlyprintk option doesn't change anything, but the board
> was booting correctly with a Daisy image.

Can you provide more details about OMAP5 EVM boot issue? I just checked my 
logs and it seems to boot fine with current 4.1.13 kernel from Fido branch up 
until when it tries to mount root over NFS (the defconfig doesn't have USB 
built-in and this board has Ethernet over USB).

-- 
Denys

