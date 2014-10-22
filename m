Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7916CE007EB; Wed, 22 Oct 2014 10:55:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B320AE00799
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 10:55:50 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9MHtmod021959
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 12:55:49 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9MHtkws016196
	for <meta-ti@yoctoproject.org>; Wed, 22 Oct 2014 23:25:47 +0530
Received: from [172.22.216.89] (172.22.216.89) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 22 Oct 2014 23:25:45 +0530
Message-ID: <5447EFA0.8090909@ti.com>
Date: Wed, 22 Oct 2014 23:25:44 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1413213179-7250-1-git-send-email-a0393906@ti.com>
	<1413213179-7250-2-git-send-email-a0393906@ti.com>
	<20141022164834.GK25408@edge>
In-Reply-To: <20141022164834.GK25408@edge>
X-Originating-IP: [172.22.216.89]
Cc: meta-ti@yoctoproject.org
Subject: Re: [master PATCH v2 1/1] ipumm-fw: Updated ipumm firmware for latest IPC version
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
X-List-Received-Date: Wed, 22 Oct 2014 17:55:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 22-Oct-14 10:18 PM, Denys Dmytriyenko wrote:
> On Mon, Oct 13, 2014 at 08:42:59PM +0530, Karthik Ramanan wrote:
>> * This includes the error handling support.
>> * Minor bug fixes
>
> Karthik,
>
> Quick question - is there a separate download link for am57xx-evm or should
> dra7xx-evm one be used for it?
>
Denys,

I believe that the same can be reused for am57xx-evm. We don't have a 
separate download link for the am57xx-evm.

Since the IPUMM binary was only used for dra7xx-evm until now the naming 
makes it sound like its specific to dra7xx-evm, we should change this 
going ahead.

Regards
Karthik

