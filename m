Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8030E00B67; Tue, 13 Jun 2017 10:31:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D9FDE00888
	for <meta-ti@yoctoproject.org>; Tue, 13 Jun 2017 10:30:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5DHUsOb012424;
	Tue, 13 Jun 2017 12:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497375054;
	bh=CtlWemQ1Upfann/JRHBq+9nuoWiCTFRPb4zOq+KWP+w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TxgPZprQfZgCzvhP8uAcPbKlQ6rQmZlQyvDCN5/kNwW4FkSCUOBa19vpS4IM8XLwp
	LfbwWm+ktt5zxl1KE6QrfrMXEVKJ58S3l6LfiKj+WQE7QGW0z1878NYG/3I9PXPhK7
	2XbMkI+W7df7/zSBE7yMKRV6ZIauVPOVY0ie5ROw=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5DHUsr3017516;
	Tue, 13 Jun 2017 12:30:54 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Jun 2017 12:30:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5DHUr0j006905;
	Tue, 13 Jun 2017 12:30:53 -0500
Date: Tue, 13 Jun 2017 13:30:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Daniel Ammann <daniel.ammann@bytesatwork.ch>
Message-ID: <20170613173051.GM21219@edge>
References: <9d0b2fc3-cfd6-f392-79b9-792025ba3dc8@bytesatwork.ch>
MIME-Version: 1.0
In-Reply-To: <9d0b2fc3-cfd6-f392-79b9-792025ba3dc8@bytesatwork.ch>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Pyro branch?
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
X-List-Received-Date: Tue, 13 Jun 2017 17:31:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Jun 08, 2017 at 12:59:54PM +0200, Daniel Ammann wrote:
> Hi
> 
> Is there going to be a pyro branch for meta-ti?
> I know that in the past there was only a new branch every other yocto 
> release, but since there was a morty branch, maybe the rule is not 
> valid anymore.

Due to limited resources, we support only 1 stable branch per year and we base 
our multiple commercial releases on it throughout the year. As you can see, 
morty is quite active right now in meta-ti. I'm also trying to keep master 
going more smoothly, as well as adopt "-next" branch for testing, so I won't 
be able to juggle so many branches and don't think I can support pyro at the 
same time. As of picking up morty, instead of pyro - it's just because we 
started this year cycle earlier and pyro wasn't out yet.

-- 
Denys

