Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1C33E0093F; Thu,  2 Mar 2017 12:39:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5B07CE0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 12:39:56 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22KdiU7012169;
	Thu, 2 Mar 2017 14:39:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488487184;
	bh=6p6Tm9eR08R5EY1+XOkFtdDAqZbG+A0p4nx68Fktf+w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=V9h1lsFVSbpE+yvHoqy1lJbho9HywQiAAhL1NVQ7q8/xveIS+XHjuYN+D9Jw+LOPQ
	UQAo+ixkZvErAS5gHRX/c//1avUSqZdMvy2h2QfLXLP6UZjkfypVcDX9zGQVDT4Cy/
	ptN6EYsF97h8IfKyxALs00ucrLi9kAqHLeEhfSS8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22KdifB024095;
	Thu, 2 Mar 2017 14:39:44 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 14:39:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22KdiEM025915;
	Thu, 2 Mar 2017 14:39:44 -0600
Date: Thu, 2 Mar 2017 15:39:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Christopher Larson <kergoth@gmail.com>
Message-ID: <20170302203943.GT12614@edge>
References: <1488443615-2456-1-git-send-email-gary@mlbassoc.com>
	<20170302171336.GQ12614@edge>
	<CABcZANmnRZA9k1XsqcjyE1mjTUzE_-HmFFFt_vmG-qKy4Ggbqw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABcZANmnRZA9k1XsqcjyE1mjTUzE_-HmFFFt_vmG-qKy4Ggbqw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: [PATCH] beaglebone.inc: Update use of obsolete bitbake API
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
X-List-Received-Date: Thu, 02 Mar 2017 20:39:59 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Mar 02, 2017 at 12:29:19PM -0700, Christopher Larson wrote:
> On Thu, Mar 2, 2017 at 10:13 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > Ah, right, I forgot about this API change when pushing to master... Thanks.
> 
> 
> As an FYI, this check should really be moved to an event handler. As it is,
> if you have meta-yocto-bsp in bblayers, it’ll show an error for each and
> every recipe that was parsed, not particularly friendly. I’ll submit a
> patch when I can find a moment.

Thanks. I noticed that too and was thinking of changing it, but so far didn't 
have time... Looking forward to your patch then! :)

-- 
Denys

