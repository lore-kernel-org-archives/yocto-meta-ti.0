Return-Path: <chriskot@quietwind.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C6F0E00E36; Mon, 12 Feb 2018 06:52:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1326 seconds by postgrey-1.32 at yocto-www;
	Mon, 12 Feb 2018 06:52:07 PST
Received: from gproxy8-pub.mail.unifiedlayer.com
	(gproxy8-pub.mail.unifiedlayer.com [67.222.33.93])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 639F0E00D1C
	for <meta-ti@yoctoproject.org>; Mon, 12 Feb 2018 06:52:07 -0800 (PST)
Received: from cmgw4 (unknown [10.0.90.85])
	by gproxy8.mail.unifiedlayer.com (Postfix) with ESMTP id 672C71AB0EF
	for <meta-ti@yoctoproject.org>; Mon, 12 Feb 2018 07:30:00 -0700 (MST)
Received: from host288.hostmonster.com ([74.220.215.88]) by cmgw4 with 
	id 9qVw1x00g1v0fLi01qVzLh; Mon, 12 Feb 2018 07:30:00 -0700
X-Authority-Analysis: v=2.2 cv=G85sK5s5 c=1 sm=1 tr=0
	a=ELBcn9xbBe8RKOfaP8USrg==:117 a=ELBcn9xbBe8RKOfaP8USrg==:17
	a=IkcTkHD0fZMA:10 a=Op4juWPpsa0A:10 a=a3UJmCwjAAAA:8 a=sozttTNsAAAA:8
	a=18mMPX-k0Vm7wZuzyvgA:9 a=QEXdDO2ut3YA:10 a=epOXxt21BGcA:10
	a=MAqy2mrZohUA:10 a=qDBoAv1wOSIDHW_xPohn:22 a=aeg5Gbbo78KNqacMgKqU:22
Received: from 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	([45.17.238.199]:50101 helo=[192.168.1.111])
	by host288.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <chriskot@quietwind.net>) id 1elF7E-000XCq-MY
	for meta-ti@yoctoproject.org; Mon, 12 Feb 2018 07:29:56 -0700
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
From: Chris Kottaridis <chriskot@quietwind.net>
Message-ID: <a22e81ab-edb8-074f-18b6-49711db46a80@quietwind.net>
Date: Mon, 12 Feb 2018 08:29:53 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host288.hostmonster.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - quietwind.net
X-BWhitelist: no
X-Source-IP: 45.17.238.199
X-Exim-ID: 1elF7E-000XCq-MY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	([192.168.1.111]) [45.17.238.199]:50101
X-Source-Auth: chriskot@quietwind.net
X-Email-Count: 1
X-Source-Cap: cXVpZXR3aW47cXVpZXR3aW47aG9zdDI4OC5ob3N0bW9uc3Rlci5jb20=
X-Local-Domain: yes
Subject: Accessing Analog Inputs
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
X-List-Received-Date: Mon, 12 Feb 2018 14:52:08 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

I followed the steps to create a beaglebone found here:

http://www.jumpnowtek.com/beaglebone/BeagleBone-Systems-with-Yocto.html

They worked like a charm, thanksyou junponowtek.

And then followed this doc to try and get the ADC available:

http://processors.wiki.ti.com/index.php/Linux_Core_ADC_Users_Guide

I loaded the module and it shows up in lsmod along with other modules it 
brings in:

# lsmod
Module                  Size  Used by
ti_am335x_adc          16384  0
kfifo_buf              16384  1 ti_am335x_adc
industrialio           57344  2 ti_am335x_adc,kfifo_buf
ti_am335x_tscadc       16384  1 ti_am335x_adc

My arch/arm/boot/dts/am335x-evm.dts file shows

&tscadc {
         status = "okay";
         tsc {
                 ti,wires = <4>;
                 ti,x-plate-resistance = <200>;
                 ti,coordinate-readouts = <5>;
                 ti,wire-config = <0x00 0x11 0x22 0x33>;
                 ti,charge-delay = <0x400>;
         };

         adc {
                 ti,adc-channels = <4 5 6 7>;
         };
};

According to the doc above loading the module should create the following:

 >On loading the module you would see the IIO device created

root@arago-armv7:~# ls -al /sys/bus/iio/devices/iio\:device0/
drwxr-xr-x    5 root     root             0 Nov  1 22:06 .
drwxr-xr-x    4 root     root             0 Nov  1 22:06 ..
drwxr-xr-x    2 root     root             0 Nov  1 22:06 buffer
-r--r--r--    1 root     root          4096 Nov  1 22:06 dev
-rw-r--r--    1 root     root          4096 Nov  1 22:06 in_voltage4_raw
-rw-r--r--    1 root     root          4096 Nov  1 22:06 in_voltage5_raw
-rw-r--r--    1 root     root          4096 Nov  1 22:06 in_voltage6_raw
-rw-r--r--    1 root     root          4096 Nov  1 22:06 in_voltage7_raw
-r--r--r--    1 root     root          4096 Nov  1 22:06 name
lrwxrwxrwx    1 root     root             0 Nov  1 22:06 of_node -> 
../../../../../../firmware/devicetree/base/ocp/tscadc@44e0d000/adc
drwxr-xr-x    2 root     root             0 Nov  1 22:06 power
drwxr-xr-x    2 root     root             0 Nov  1 22:06 scan_elements
lrwxrwxrwx    1 root     root             0 Nov  1 22:06 subsystem -> 
../../../../../../bus/iio
-rw-r--r--    1 root     root          4096 Nov  1 22:06 uevent

While the /sys/bus/iio directory got created when I loaded the module 
the device directory is empty

# ls /sys/bus/iio/devices
#

What am I missing that is preventing the ADC interface from being created ?

Any pointers would be appreciated.

Thanks
Chris K


