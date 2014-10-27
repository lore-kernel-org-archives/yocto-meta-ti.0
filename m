Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 812EEE00902; Mon, 27 Oct 2014 01:42:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9D5FE0084A
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 01:42:03 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s9R8g1I6005142
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 03:42:02 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s9R8fx1j002649
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 14:12:00 +0530
Received: from [172.24.157.139] (172.24.157.139) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Mon, 27 Oct 2014 14:11:58 +0530
Message-ID: <544E0555.3010507@ti.com>
Date: Mon, 27 Oct 2014 14:11:57 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1411559009-7951-2-git-send-email-a0393906@ti.com>
	<1412142291-11850-1-git-send-email-a0393906@ti.com>
	<20141007191647.GD1731@edge>
In-Reply-To: <20141007191647.GD1731@edge>
X-Originating-IP: [172.24.157.139]
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH v2] dspdce-fw: Updated dspdce firmware for latest IPC version
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
X-List-Received-Date: Mon, 27 Oct 2014 08:42:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08-Oct-14 12:46 AM, Denys Dmytriyenko wrote:
> Karthik,
>
> I'm at lost here. You did address my previous comment of not leaving 2
> versions, just updating from .02 to .04, but I don't understand why do you
> need an .inc file for, if there's only one version left?
>
> I traced it a bit back and there was a recommendation from Franklin about
> creating .inc file for a different recipe for ipumm-fw, but in that case it is
> warranted due to the fact that you pull 2 different sources for 2 platforms.
> So, in that case it might be better having 2 separate recipes for different
> machines with common parts in the .inc file, but see for yourself if that
> produces cleaner and simpler results. It's not alwats clear cut and you may
> need to experiment to choose the right option...
>
> Either way, dspdce-fw doesn't seem to need an .inc file.
>

Denys,

There is a case where there may be multiple dspdce firmware versions 
based on different versions of IPC. It will make sense that we introduce 
the inc file when there is a need.

I will abandon this patch and resubmit a v3 for this.

Regards
Karthik

