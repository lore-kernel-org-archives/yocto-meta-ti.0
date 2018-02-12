Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C9F54E00DD9; Mon, 12 Feb 2018 10:06:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 291D8E009BB
	for <meta-ti@yoctoproject.org>; Mon, 12 Feb 2018 10:06:58 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1CI6wdh030069;
	Mon, 12 Feb 2018 12:06:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1518458818;
	bh=ndeFfARZPwZ72n55zUFJGX6/eHduU9Bt0i5C5KtOGlk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=TFiYjQsgq65mL/ar+/kX+OQbgCnxH4u1s4PZEvK+nId9L7XvuNhKroMnu8rmRk6zj
	5Bsjx+0n0rajBKzHt7ML9wlPpIdfu/tbCSCR46UC7JehzVnf84EqAn/lXBU+nm0sA5
	ooExgRo6fA3Z69zd2kFaltMpwyarLShsmaOcZTm0=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1CI6vsj014756;
	Mon, 12 Feb 2018 12:06:58 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 12 Feb 2018 12:06:57 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 12 Feb 2018 12:06:57 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1CI6vo2019210;
	Mon, 12 Feb 2018 12:06:57 -0600
Date: Mon, 12 Feb 2018 13:06:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Adam Lee <adam.yh.lee@gmail.com>
Message-ID: <20180212180656.GF31854@edge>
References: <CAFeBWL7N1D8KQxdz2AqhDHbcww8+8x8ouMKRw4rK5ubf7Z63Uw@mail.gmail.com>
	<CAFeBWL5wNMRYoK1wW3nL3xo10ySpJbdYXmPjr0fnVBctyR7Lyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFeBWL5wNMRYoK1wW3nL3xo10ySpJbdYXmPjr0fnVBctyR7Lyw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Weston Desktop Shell
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
X-List-Received-Date: Mon, 12 Feb 2018 18:06:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Adam,

We just switched from Morty to Rocko as our LTS branch couple months ago and 
some features are still missing, while teams are ramping up. This particular 
issue requires Weston patching in meta-arago, but Weston 2.0 changed some APIs 
and those patches no longer apply. Hopefully we'll be able to resolve this in 
the near future.

Since this is specific to meta-arago, please direct any further questions to 
the corresponding mailing list at meta-arago@arago-project.org

-- 
Denys


On Mon, Feb 12, 2018 at 04:03:54PM +0000, Adam Lee wrote:
> I spent a bit of time getting the logs:
> 
> Any insight as to why this is happening, it would be much appreciated.
> 
> Adam
> 
> On Fri, Feb 9, 2018 at 3:26 PM Adam Lee <adam.yh.lee@gmail.com> wrote:
> 
> > Has anyone successfully brought up Weston desktop shell on the current
> > master on Beagleboard X15 or AM57xx-EVM? I am having EGL initialization
> > error. I don't know if it is something I have mis-configured.
> >
> > BR,
> >
> > Adam
> >

> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


