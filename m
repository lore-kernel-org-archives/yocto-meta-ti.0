Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39C79E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:54:40 -0800 (PST)
Received: by wgbds10 with SMTP id ds10so2181335wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:54:39 -0800 (PST)
Received: by 10.180.100.234 with SMTP id fb10mr13484386wib.8.1327697678986;
	Fri, 27 Jan 2012 12:54:38 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm26762732wib.0.2012.01.27.12.54.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 12:54:37 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F230E21.9010405@balister.org>
Date: Fri, 27 Jan 2012 21:54:36 +0100
Message-Id: <085F880B-60EA-4151-8C28-2E5BFD03DAB3@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2304E7.7070809@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>	<20120127202150.GE8707@denix.org>
	<4F230803.1070503@ti.com> <4F230E21.9010405@balister.org>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from	arago	overlay
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 20:54:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 27 jan. 2012, om 21:50 heeft Philip Balister het volgende geschreven:

> On 01/27/2012 03:24 PM, William Mills wrote:
>> 
> .....
> 
> 
>>>> can
>>>> agree to spliting meta-ti into two layers, a HW layer for our devices
>>>> and a
>>>> layer containing all of the TI recipes.
>>>> 
>>>> But if we wanted to match the meta-intel layer way would you also
>>>> propose
>>>> making a layer per device?  I personally find that more confusing.
>>> I don't think that was Bill's message. It was simplicity. BSP only
>>> layer, no
>>> supplemental apps, if not absolutely required.
>>> 
>>> Your example with lmbench is not correct - BSP layer should be simple
>>> enough
>>> to be used with OE-Core alone to produce a console rootfs image with
>>> nothing
>>> but busybox.
>>> 
>>> How about splitting meta-ti into:
>>> * BSP only
>>> * SGX graphics
>>> * DSP tools
>>> * WiFi etc.
>>> 
>>> And then splitting meta-arago into:
>>> * Arago distro for TI SDKs
>>> * Supplemental apps
>>> 
>> 
>> Need to get my "YES!" in here before everyone barfs all over the
>> proposal :)
>> 
>> Chase: your right.  I do not want to follow intel's example of layer per
>> BSP.
> 
> I build stuff for the USRP E100 (based on a gumstic overo). I use my own
> later for BSP that provides kernel, u-boot, and image recipes.
> 
> I still need a TI BSP layer for DSP stuff (we do not care about SGX,
> although it is possible customers could).
> 
> Do forget your customers using all this to ship products.

OK, I will forget it promptly :)


