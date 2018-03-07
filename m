Return-Path: <chriskot@quietwind.net>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 195BAE00E49; Wed,  7 Mar 2018 09:43:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [69.89.20.226 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 2378 seconds by postgrey-1.32 at yocto-www;
	Wed, 07 Mar 2018 09:43:27 PST
Received: from gproxy10-pub.mail.unifiedlayer.com
	(gproxy10-pub.mail.unifiedlayer.com [69.89.20.226])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D285E008FB
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2018 09:43:27 -0800 (PST)
Received: from cmgw2 (unknown [10.0.90.83])
	by gproxy10.mail.unifiedlayer.com (Postfix) with ESMTP id E058B1412C7
	for <meta-ti@yoctoproject.org>; Wed,  7 Mar 2018 09:37:38 -0700 (MST)
Received: from host288.hostmonster.com ([74.220.215.88]) by cmgw2 with 
	id K4db1x00Y1v0fLi014deBA; Wed, 07 Mar 2018 09:37:38 -0700
X-Authority-Analysis: v=2.2 cv=M5g9E24s c=1 sm=1 tr=0
	a=ELBcn9xbBe8RKOfaP8USrg==:117 a=ELBcn9xbBe8RKOfaP8USrg==:17
	a=v2DPQv5-lfwA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=fZryiLo3GDH2IWudaT4A:9
	a=QEXdDO2ut3YA:10 a=0ND0iXmQkscsPs_MpgsA:9 a=hquHOILUSkIA:10
Received: from 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	([45.17.238.199]:35108 helo=creto.localdomain)
	by host288.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.89_1)
	(envelope-from <chriskot@quietwind.net>) id 1etc4N-001P02-Dq
	for meta-ti@yoctoproject.org; Wed, 07 Mar 2018 09:37:35 -0700
To: meta-ti@yoctoproject.org
From: Chris Kottaridis <chriskot@quietwind.net>
Message-ID: <119a0f65-4bcb-4a64-fb9b-78186689ad26@quietwind.net>
Date: Wed, 7 Mar 2018 10:37:30 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
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
X-Exim-ID: 1etc4N-001P02-Dq
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 45-17-238-199.lightspeed.rcsntx.sbcglobal.net
	(creto.localdomain) [45.17.238.199]:35108
X-Source-Auth: chriskot@quietwind.net
X-Email-Count: 1
X-Source-Cap: cXVpZXR3aW47cXVpZXR3aW47aG9zdDI4OC5ob3N0bW9uc3Rlci5jb20=
X-Local-Domain: yes
Subject: Simple typo bug
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
X-List-Received-Date: Wed, 07 Mar 2018 17:43:28 -0000
X-Groupsio-MsgNum: 10685
Content-Type: multipart/mixed; boundary="------------391492D6B8CF43E14AEDCD39"
Content-Language: en-US

--------------391492D6B8CF43E14AEDCD39
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

I found this via code inspection. Notice that in

drivers/mfd/ti_am335x_tscadc.c

it passes the string "ti,coordiante-readouts" on line 144:

  142         node = of_get_child_by_name(pdev->dev.of_node, "tsc");
  143         of_property_read_u32(node, "ti,wires", &tsc_wires);
  144         of_property_read_u32(node, "ti,coordiante-readouts", 
&readouts);
  145

I believe this routine is reading a property from
arch/arm/boot/dts/am335x-evm.dts

Note on line 733 it has "ti,coordinate-readouts":

  728 &tscadc {
  729         status = "okay";
  730         tsc {
  731                 ti,wires = <4>;
  732                 ti,x-plate-resistance = <200>;
  733                 ti,coordinate-readouts = <5>;
  734                 ti,wire-config = <0x00 0x11 0x22 0x33>;
  735                 ti,charge-delay = <0x400>;
  736         };
  737
  738         adc {
  739                 ti,adc-channels = <4 5 6 7>;
  740         };
  741 };

I assume there is a simple character transposition issue between the two 
lines
where the "a" and "n" got transposed. I assume line 144 in file

ti_am335x_tscadc.c

should be:

of_property_read_u32(node, "ti,coordinate-readouts", &readouts);

Thanks

Chris Kottaridis


--------------391492D6B8CF43E14AEDCD39
Content-Type: text/x-patch;
 name="typobug.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="typobug.diff"

diff --git a/drivers/mfd/ti_am335x_tscadc.c b/drivers/mfd/ti_am335x_tscadc.c
index 0f3fab47fe48..1a73582c65e0 100644
--- a/drivers/mfd/ti_am335x_tscadc.c
+++ b/drivers/mfd/ti_am335x_tscadc.c
@@ -141,7 +141,7 @@ static	int ti_tscadc_probe(struct platform_device *pdev)
 
 	node = of_get_child_by_name(pdev->dev.of_node, "tsc");
 	of_property_read_u32(node, "ti,wires", &tsc_wires);
-	of_property_read_u32(node, "ti,coordiante-readouts", &readouts);
+	of_property_read_u32(node, "ti,coordinate-readouts", &readouts);
 
 	node = of_get_child_by_name(pdev->dev.of_node, "adc");
 	of_property_for_each_u32(node, "ti,adc-channels", prop, cur, val) {

--------------391492D6B8CF43E14AEDCD39--
