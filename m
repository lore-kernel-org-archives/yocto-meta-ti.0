Return-Path: <Valentin.Cobelea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 3DFC4E0168B
	for <meta-ti@yoctoproject.org>; Tue,  8 Oct 2013 02:16:14 -0700 (PDT)
Received: from localhost.enea.se (192.168.14.198) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1; Tue, 8 Oct 2013
	11:16:09 +0200
Message-ID: <5253CD58.4060300@enea.com>
Date: Tue, 8 Oct 2013 12:16:08 +0300
From: Vali Cobelea <valentin.cobelea@enea.com>
Organization: ENEA
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130923 Thunderbird/17.0.9
MIME-Version: 1.0
To: <meta-ti@yoctoproject.org>
X-Originating-IP: [192.168.14.198]
Subject: Real-time / hardware clock issues
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
X-List-Received-Date: Tue, 08 Oct 2013 09:16:16 -0000
Content-Type: multipart/alternative;
	boundary="------------060503000000040506010806"

--------------060503000000040506010806
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi guys,

We've encountered an issue whit the Keystone 2 target regarding the 
real-time / hardware clock.
The problem first appears during the boot process, as shown below in the 
log. Seems that the rtc device (eg. rtc0) is not present.

...

[    0.592146] 8021q: 802.1Q VLAN Support v1.8
[    0.592817] sctp: Hash tables configured (established 16384 bind 16384)
[    0.593721] NET: Registered protocol family 40
[    0.594339] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.595360] Registering SWP/SWPB emulation handler
*[    0.596230] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)*
[    0.597856] keystone-netcp 2090000.netcp: initializing cpsw version 1.3 (1) SGMII identification value 0x4ed1
[    0.599351] keystone-netcp 2090000.netcp: Created a cpsw ale engine
[    0.600184] keystone-netcp 2090000.netcp: initialized cpsw ale revision 1.3
[    0.610193] keystone-netcp 2090000.netcp: Using Packet Accelerator Firmware version 0x01030008
[    0.611338] keystone-netcp 2090000.netcp: pa_clk_rate(204800000 HZ),mult(20000),shift(12)

...

root@keystone-evm:~# ls -al /dev/misc/rtc
ls: /dev/misc/rtc: No such file or directory

root@keystone-evm:~# ls -al /dev/rtc0
ls: /dev/rtc0: No such file or directory


Another issue, linked to the rt/hw clock and maybe to the above problem, 
can be seen while running the 'date' command, in the sense that if you 
run the command several times for *at least* 4-5 seconds, the command 
will output *only* a time change (the seconds will increment only once 
during the 4-5 seconds of 'date' command run one after another).

Was this problem reproduced by anyone else ?
Could this be
#1. a kernel missing configuration (the following are missing from the 
.config, adding them and rebuilding the kernel did not solved any of the 
issues):

CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_INTF_SYSFS=y
CONFIG_RTC_INTF_PROC=y
CONFIG_RTC_INTF_DEV=y

#2. or a clock frequency:
in arch/arm/boot/dts/k2hk-evm.dts we should then add the 
'clock-frequency' to a proper value:

                 timer {
                         compatible = "arm,armv7-timer";
                         interrupts = <1 13 0xf08 1 14 0xf08>;
+                        clock-frequency = <134221720>;
                 };

#3. or a hardware problem ?


We are not sure on the cause of this rt/hw clock issue yet; any 
advice/input would help us a lot.

Thank you,
Valentin

--------------060503000000040506010806
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Hi guys,<br>
    <br>
    We've encountered an issue whit the Keystone 2 target regarding the
    real-time / hardware clock.<br>
    The problem first appears during the boot process, as shown below in
    the log. Seems that the rtc device (eg. rtc0) is not present.<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    ...<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    <pre style="color: rgb(0, 0, 0); font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; word-wrap: break-word; white-space: pre-wrap;">[    0.592146] 8021q: 802.1Q VLAN Support v1.8
[    0.592817] sctp: Hash tables configured (established 16384 bind 16384)
[    0.593721] NET: Registered protocol family 40
[    0.594339] VFP support v0.3: implementor 41 architecture 4 part 30 variant f rev 0
[    0.595360] Registering SWP/SWPB emulation handler
<b>[    0.596230] drivers/rtc/hctosys.c: unable to open rtc device (rtc0)</b>
[    0.597856] keystone-netcp 2090000.netcp: initializing cpsw version 1.3 (1) SGMII identification value 0x4ed1
[    0.599351] keystone-netcp 2090000.netcp: Created a cpsw ale engine
[    0.600184] keystone-netcp 2090000.netcp: initialized cpsw ale revision 1.3
[    0.610193] keystone-netcp 2090000.netcp: Using Packet Accelerator Firmware version 0x01030008
[    0.611338] keystone-netcp 2090000.netcp: pa_clk_rate(204800000 HZ),mult(20000),shift(12)
</pre>
    ...<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    root@keystone-evm:~# ls -al /dev/misc/rtc<br>
    ls: /dev/misc/rtc: No such file or directory<br>
    <br>
    root@keystone-evm:~# ls -al /dev/rtc0<br>
    ls: /dev/rtc0: No such file or directory<br>
    <br>
    <br>
    Another issue, linked to the rt/hw clock and maybe to the above
    problem, can be seen while running the 'date' command, in the sense
    that if you run the command several times for *at least* 4-5
    seconds, the command will output *only* a time change (the seconds
    will increment only once during the 4-5 seconds of 'date' command
    run one after another).<br>
    <br>
    Was this problem reproduced by anyone else ?<br>
    Could this be<br>
    #1. a kernel missing configuration (the following are missing from
    the .config, adding them and rebuilding the kernel did not solved
    any of the issues):<br>
    <br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    CONFIG_RTC_CLASS=y<br>
    CONFIG_RTC_HCTOSYS=y<br>
    CONFIG_RTC_HCTOSYS_DEVICE="rtc0"<br>
    CONFIG_RTC_INTF_SYSFS=y<br>
    CONFIG_RTC_INTF_PROC=y<br>
    CONFIG_RTC_INTF_DEV=y<br>
    <br>
    #2. or a clock frequency:<br>
    <meta http-equiv="content-type" content="text/html;
      charset=ISO-8859-1">
    in arch/arm/boot/dts/k2hk-evm.dts we should then add the
    'clock-frequency' to a proper value:<br>
    <br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; timer {<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; compatible = "arm,armv7-timer";<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; interrupts = &lt;1 13 0xf08 1 14 0xf08&gt;;<br>
    +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clock-frequency = &lt;134221720&gt;;<br>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
    <br>
    #3. or a hardware problem ?<br>
    <br>
    <br>
    We are not sure on the cause of this rt/hw clock issue yet; any
    advice/input would help us a lot.<br>
    <br>
    Thank you,<br>
    Valentin<br>
  </body>
</html>

--------------060503000000040506010806--
