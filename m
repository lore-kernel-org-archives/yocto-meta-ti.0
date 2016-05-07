Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EE095E00C94; Fri,  6 May 2016 18:51:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_05,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [62.149.158.120 listed in list.dnswl.org]
	* -0.5 BAYES_05 BODY: Bayes spam probability is 1 to 5%
	*      [score: 0.0283]
X-Greylist: delayed 63 seconds by postgrey-1.32 at yocto-www;
	Fri, 06 May 2016 18:51:53 PDT
Received: from smtpweb120.aruba.it (smtpweb120.aruba.it [62.149.158.120])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42182E00C86
	for <meta-ti@yoctoproject.org>; Fri,  6 May 2016 18:51:53 -0700 (PDT)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd03.ad.aruba.it with bizsmtp
	id rDqo1s00E0S5K6601DqopK; Sat, 07 May 2016 03:50:49 +0200
To: meta-ti@yoctoproject.org
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Message-ID: <572D49F7.4060107@phoenixsoftware.it>
Date: Sat, 7 May 2016 03:50:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
Subject: Unhandled fault loading PRU related modules
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
X-List-Received-Date: Sat, 07 May 2016 01:51:55 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
using lastest TI SDK 02.00.02, I observed "Unhandled fault" messages 
while loading PRU modules.
This is causing some problem lately in suspend resume process.
After some investigations, I suppose the cause is the CPU type: I'm 
using AM3354 that doesn't have PRU.

Is there any way to let the probe cleanly fail with something like 
-ENODEV testing at runtime if the CPU is AM3352 or AM3354?

Thanks
BR
Pierluigi

