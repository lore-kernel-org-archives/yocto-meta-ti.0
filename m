Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B09CE00566; Wed,  3 Sep 2014 02:25:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtpcmd01217.aruba.it (smtpcmd01217.aruba.it [62.149.158.217])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D3A1E0054C
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 02:25:34 -0700 (PDT)
Received: from [192.168.0.90] ([93.39.88.63])
	by smtpcmd01.ad.aruba.it with bizsmtp
	id mZRW1o00q1N064D01ZRWAk; Wed, 03 Sep 2014 11:25:31 +0200
Message-ID: <5406DE8A.90801@phoenixsoftware.it>
Date: Wed, 03 Sep 2014 11:25:30 +0200
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <54064ACC.9020702@phoenixsoftware.it> <20140903015326.GP18620@edge>
In-Reply-To: <20140903015326.GP18620@edge>
Cc: meta-ti@yoctoproject.org
Subject: Re: AM335X EVMSK kernel problem
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
X-List-Received-Date: Wed, 03 Sep 2014 09:25:40 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Denys,
how can I identify "latest known good commit from meta-ti for 
linux-ti-staging"?

Thanks
Pierluigi

On 03/09/2014 03:53, Denys Dmytriyenko wrote:
> Pierluigi,
>
> Try the latest known good commit from meta-ti for linux-ti-staging, as
> meta-arago AUTOREV's the commit and there were some known regressions in the
> past few days, that are being looked at now.

