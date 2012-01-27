Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D656E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:51:15 -0800 (PST)
Received: (qmail 28427 invoked by uid 1003); 27 Jan 2012 20:50:43 -0000
Received: from unknown (HELO ?192.168.1.104?)
	(philip@opensdr.com@96.240.160.175)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	27 Jan 2012 20:50:43 -0000
Message-ID: <4F230E21.9010405@balister.org>
Date: Fri, 27 Jan 2012 15:50:41 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: William Mills <wmills@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2304E7.7070809@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>	<20120127202150.GE8707@denix.org>
	<4F230803.1070503@ti.com>
In-Reply-To: <4F230803.1070503@ti.com>
X-Enigmail-Version: 1.1.2
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Fri, 27 Jan 2012 20:51:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/27/2012 03:24 PM, William Mills wrote:
> 
.....


>>> can
>>> agree to spliting meta-ti into two layers, a HW layer for our devices
>>> and a
>>> layer containing all of the TI recipes.
>>>
>>> But if we wanted to match the meta-intel layer way would you also
>>> propose
>>> making a layer per device?  I personally find that more confusing.
>> I don't think that was Bill's message. It was simplicity. BSP only
>> layer, no
>> supplemental apps, if not absolutely required.
>>
>> Your example with lmbench is not correct - BSP layer should be simple
>> enough
>> to be used with OE-Core alone to produce a console rootfs image with
>> nothing
>> but busybox.
>>
>> How about splitting meta-ti into:
>> * BSP only
>> * SGX graphics
>> * DSP tools
>> * WiFi etc.
>>
>> And then splitting meta-arago into:
>> * Arago distro for TI SDKs
>> * Supplemental apps
>>
> 
> Need to get my "YES!" in here before everyone barfs all over the
> proposal :)
> 
> Chase: your right.  I do not want to follow intel's example of layer per
> BSP.

I build stuff for the USRP E100 (based on a gumstic overo). I use my own
later for BSP that provides kernel, u-boot, and image recipes.

I still need a TI BSP layer for DSP stuff (we do not care about SGX,
although it is possible customers could).

Do forget your customers using all this to ship products.

Philip

