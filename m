Return-Path: <pierluigi.passaro@phoenixsoftware.it>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E80BE00C94; Fri,  6 May 2016 19:04:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [62.149.158.120 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from smtpweb120.aruba.it (smtpweb120.aruba.it [62.149.158.120])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD75AE00C86
	for <meta-ti@yoctoproject.org>; Fri,  6 May 2016 19:04:37 -0700 (PDT)
Received: from [192.168.1.71] ([94.33.39.20])
	by smtpcmd03.ad.aruba.it with bizsmtp
	id rE4b1s00N0S5K6601E4blS; Sat, 07 May 2016 04:04:35 +0200
To: meta-ti@yoctoproject.org
From: Pierluigi Passaro <pierluigi.passaro@phoenixsoftware.it>
Message-ID: <572D4D32.7020006@phoenixsoftware.it>
Date: Sat, 7 May 2016 04:04:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
Subject: AM335x Power Management Standby
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
X-List-Received-Date: Sat, 07 May 2016 02:04:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,
I'm testing suspend resume with latest TI SDK 02.00.02 on AM3354 but I'm 
observing some strange behaviours.

1) GPIO banks
It looks that GPIOs from banks different from 0 are not able to resume 
the neither in mem, nor in stanby mode: is the expected behaviour?

2) TSC
It looks that the first time you suspend the board is not able to cause 
the wakeup, but if you wakeup in any other ways, the following times the 
TSC correctly wakeup the board.

3) USB
According link
http://processors.wiki.ti.com/index.php/AM335x_Power_Management_Standby_User's_Guide#USB_wakeup
the USB should wakeup the board, but nothing happen.

4) UART
According link
http://processors.wiki.ti.com/index.php/AM335x_Power_Management_Standby_User's_Guide#Wakeup_Sources
the UARTs could be allowed to wakeup the boards, but the procedure does 
not apply (invalid sys path)

Anyone tested wakeup sources with AM3354?
Any suggestion or workaround?

Thanks
Regards
Pierluigi

