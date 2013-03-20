Return-Path: <grunzasr@comcast.net>
Received: from qmta03.westchester.pa.mail.comcast.net
	(qmta03.westchester.pa.mail.comcast.net [76.96.62.32])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 223CCE006D6
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2013 11:18:30 -0700 (PDT)
Received: from omta18.westchester.pa.mail.comcast.net ([76.96.62.90])
	by qmta03.westchester.pa.mail.comcast.net with comcast
	id Dmx61l00F1wpRvQ53uJVSm; Wed, 20 Mar 2013 18:18:29 +0000
Received: from [127.0.0.1] ([71.225.124.244])
	by omta18.westchester.pa.mail.comcast.net with comcast
	id DuJU1l00n5GVvnK3euJVp1; Wed, 20 Mar 2013 18:18:29 +0000
Message-ID: <5149FD74.3030906@comcast.net>
Date: Wed, 20 Mar 2013 14:18:28 -0400
From: Steven Grunza <grunzasr@comcast.net>
User-Agent: Mozilla/5.0 (Windows NT 5.1;
	rv:17.0) Gecko/20130307 Thunderbird/17.0.4
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <514873B9.3020500@comcast.net> <20130319172138.GQ32759@edge>
	<5148A9B4.5060702@comcast.net> <20130319182747.GH14761@denix.org>
	<5149C666.7040306@comcast.net> <20130320151759.GP14761@denix.org>
	<5149F665.9090204@comcast.net> <20130320175415.GW32759@edge>
In-Reply-To: <20130320175415.GW32759@edge>
X-Antivirus: avast! (VPS 130320-0, 03/20/2013), Outbound message
X-Antivirus-Status: Clean
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1363803509;
	bh=J1YeMMg6B7WmLuy9DBowOV0clvsG7uYhNtFeFSgfrR0=;
	h=Received:Received:Message-ID:Date:From:Reply-To:MIME-Version:To:
	Subject:Content-Type;
	b=KIw4Ql4Rpv6pEFN7iGP0k1516unnq8mY8erFMcOipI79r7sk1wrnbAHyAdwWAxTy+
	JEuyPh3fhhydjF7gR9tawKbn9FOsAMK1WGTFPjtKYljZ3SL1xYAZrDf+Oj2rV+Z1l4
	EV/PbGljx9/y/0Xqusp9A7dYz/OWKUWQL4kUkRa0bre8m6CeysubyVZYom8IE4/CBy
	eFdIljOtedmT8rR86UynfLgPK6nrZbqG44OZVpyhPuM54U4n6BWDD0GDyxPs+FGRd3
	n6znoGXnMzsgYha/Xyz7OL9dJGNWr28ra3QwYcw4cI+jw01tjALa9xM75ntTfrPIg4
	3EdK3EMGBzJ2Q==
Subject: Re: Is this the correct list for AM3517 EVM questions?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: grunzasr@comcast.net
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 20 Mar 2013 18:18:30 -0000
Content-Type: multipart/alternative;
	boundary="------------030507060006080303040201"

--------------030507060006080303040201
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 3/20/2013 1:54 PM, Denys Dmytriyenko wrote:
> On Wed, Mar 20, 2013 at 01:48:21PM -0400, Steven Grunza wrote:
>> On 3/20/2013 11:17 AM, Denys Dmytriyenko wrote:
>>> On Wed, Mar 20, 2013 at 10:23:34AM -0400, Steven Grunza wrote:
>>>> On 3/19/2013 2:27 PM, Denys Dmytriyenko wrote:
>>>>> On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
>>>>>> On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
>>>>>>> On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
>>>>>>>> Hello,
>>>>>>>>    I have a LogicPD Zoom AM3517 experimenters board.  Is this the
>>>>>>>> correct list to ask questions about getting Yocto-based software
>>>>>>>> running on this board?
>>>>>>> Yes, this is one of the correct lists for asking questions about AM3517 board
>>>>>>> when used with the Yocto Project. :) As this is the mailing list for meta-ti,
>>>>>>> which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
>>>>>>> the Yocto Project, and AM3517 is currently one of the supported platforms in
>>>>>>> meta-ti.
>>>>>>>
>>>>>> Wonderful.  Can someone point me to information so that I can build
>>>>>> a system using the Yocto project and program an SD card with the
>>>>>> necessary files to boot my board into Linux?
>>>>>>
>>>>>>    With all of the S7 DIP switches in the off position (which the
>>>>>> AM3517 Development Kits User Manual indicates is the default boot
>>>>> >from NAND) I don't get any output from the serial UART so my guess
>>>>>> is that I've hosed the NAND.
>>>>>>
>>>>>>    For debugging support I have a TI Stellaris LM3S8962 board which
>>>>>> has the ability to act as a JTAG debugger to external hardware.  For
>>>>>> software I have OpenOCD 0.6.1
>>>>> I would assume you already checked this Hardware Setup page:
>>>>> http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup
>>>>>
>>>>> Then you would need to check the Boot from SD/MMC page:
>>>>> http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card
>>>>>
>>>>> As of the software load, you can build a minimal rootfs image (e.g.
>>>>> core-image-minimal) with all the BSP components and setup an SD card as
>>>>> described above. You'll get the MLO, u-boot, uImage and rootfs as the
>>>>> output of the build, that you need to load on to the card.
>>>> To what should I have MACHINE set?  Using beagleboard didn't work.
>>> There is "am3517-evm" machine in meta-ti:
>>> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine
>>>
>> What is the proper way to include the above file in my build
>> environment or is there a URL describing it that I've missed?
> You need to add meta-ti layer to your configuration. It can be as easy as
> git-cloning it into your sources location, along with other "meta" layers and
> adding it to your bblayers.conf file. You'd need to also add BBMASK to your
> local.conf, as described in meta-ti README file. After that you can build for
> MACHINE=am3517-evm
>

I did something wrong or missed a step.  I got:

grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$ bitbake 
core-image-sato-sdk
Pseudo is not present but is required, building this first before the 
main build
Parsing recipes: 100% 
|#####################################################################################################| 
Time: 00:02:17
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1205 targets, 
67 skipped, 7 masked, 0 errors.
ERROR: No recipes available for:
/home/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend
ERROR: Command execution failed: Exited with 1

I put the meta-ti (via a git clone) into /home/yocto/poky-danny-8.0

grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$ ls -l 
/home/yocto/poky-danny-8.0
total 72
drwxrwxr-x  6 grunzasr grunzasr  4096 Oct 22 19:03 bitbake
drwxrwxr-x  6 grunzasr grunzasr  4096 Mar 20 14:11 build
drwxrwxr-x 11 grunzasr grunzasr  4096 Oct 22 19:03 documentation
-rw-rw-r--  1 grunzasr grunzasr   545 Oct 22 19:03 LICENSE
drwxrwxr-x 21 grunzasr grunzasr  4096 Oct 22 19:03 meta
drwxrwxr-x  4 grunzasr grunzasr  4096 Oct 22 19:03 meta-hob
drwxrwxr-x  5 grunzasr grunzasr  4096 Oct 22 19:03 meta-skeleton
drwxr-xr-x 12 grunzasr grunzasr  4096 Mar 20 14:04 meta-ti
drwxrwxr-x  6 grunzasr grunzasr  4096 Oct 22 19:03 meta-yocto
drwxrwxr-x  9 grunzasr grunzasr  4096 Oct 22 19:03 meta-yocto-bsp
-rwxrwxr-x  1 grunzasr grunzasr  1531 Oct 22 19:03 oe-init-build-env
-rw-rw-r--  1 grunzasr grunzasr  2038 Oct 22 19:03 README
-rw-rw-r--  1 grunzasr grunzasr 17245 Oct 22 19:03 README.hardware
drwxrwxr-x  8 grunzasr grunzasr  4096 Oct 22 19:03 scripts

Is there another meta package I need?



--------------030507060006080303040201
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 3/20/2013 1:54 PM, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote cite="mid:20130320175415.GW32759@edge" type="cite">
      <pre wrap="">On Wed, Mar 20, 2013 at 01:48:21PM -0400, Steven Grunza wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">On 3/20/2013 11:17 AM, Denys Dmytriyenko wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="">On Wed, Mar 20, 2013 at 10:23:34AM -0400, Steven Grunza wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="">On 3/19/2013 2:27 PM, Denys Dmytriyenko wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="">On Tue, Mar 19, 2013 at 02:08:52PM -0400, Steven Grunza wrote:
</pre>
              <blockquote type="cite">
                <pre wrap="">On 3/19/2013 1:21 PM, Denys Dmytriyenko wrote:
</pre>
                <blockquote type="cite">
                  <pre wrap="">On Tue, Mar 19, 2013 at 10:18:33AM -0400, Steven Grunza wrote:
</pre>
                  <blockquote type="cite">
                    <pre wrap="">Hello,
  I have a LogicPD Zoom AM3517 experimenters board.  Is this the
correct list to ask questions about getting Yocto-based software
running on this board?
</pre>
                  </blockquote>
                  <pre wrap="">Yes, this is one of the correct lists for asking questions about AM3517 board
when used with the Yocto Project. :) As this is the mailing list for meta-ti,
which is the official Texas Instruments BSP layer for OpenEmbedded-Core and
the Yocto Project, and AM3517 is currently one of the supported platforms in
meta-ti.

</pre>
                </blockquote>
                <pre wrap="">Wonderful.  Can someone point me to information so that I can build
a system using the Yocto project and program an SD card with the
necessary files to boot my board into Linux?

  With all of the S7 DIP switches in the off position (which the
AM3517 Development Kits User Manual indicates is the default boot
</pre>
              </blockquote>
              <pre wrap="">&gt;from NAND) I don't get any output from the serial UART so my guess
</pre>
              <blockquote type="cite">
                <pre wrap="">is that I've hosed the NAND.

  For debugging support I have a TI Stellaris LM3S8962 board which
has the ability to act as a JTAG debugger to external hardware.  For
software I have OpenOCD 0.6.1
</pre>
              </blockquote>
              <pre wrap="">I would assume you already checked this Hardware Setup page:
<a class="moz-txt-link-freetext" href="http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup">http://processors.wiki.ti.com/index.php/GSG:_AM35x_EVM_Hardware_Setup</a>

Then you would need to check the Boot from SD/MMC page:
<a class="moz-txt-link-freetext" href="http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card">http://processors.wiki.ti.com/index.php/AM35x_EVM_Boot_from_SD/MMC_card</a>

As of the software load, you can build a minimal rootfs image (e.g.
core-image-minimal) with all the BSP components and setup an SD card as
described above. You'll get the MLO, u-boot, uImage and rootfs as the
output of the build, that you need to load on to the card.
</pre>
            </blockquote>
            <pre wrap="">To what should I have MACHINE set?  Using beagleboard didn't work.
</pre>
          </blockquote>
          <pre wrap="">There is "am3517-evm" machine in meta-ti:
<a class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine</a>

</pre>
        </blockquote>
        <pre wrap="">What is the proper way to include the above file in my build
environment or is there a URL describing it that I've missed?
</pre>
      </blockquote>
      <pre wrap="">
You need to add meta-ti layer to your configuration. It can be as easy as 
git-cloning it into your sources location, along with other "meta" layers and 
adding it to your bblayers.conf file. You'd need to also add BBMASK to your 
local.conf, as described in meta-ti README file. After that you can build for 
MACHINE=am3517-evm

</pre>
    </blockquote>
    <br>
    I did something wrong or missed a step.&nbsp; I got:<br>
    <br>
    <small><font face="Courier New, Courier, monospace"><a class="moz-txt-link-abbreviated" href="mailto:grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$">grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$</a>
        bitbake core-image-sato-sdk<br>
        Pseudo is not present but is required, building this first
        before the main build<br>
        Parsing recipes: 100%
        |#####################################################################################################|
        Time: 00:02:17<br>
        Parsing of 899 .bb files complete (0 cached, 899 parsed). 1205
        targets, 67 skipped, 7 masked, 0 errors.<br>
        ERROR: No recipes available for:<br>
        &nbsp;
/home/yocto/poky-danny-8.0/meta-ti/recipes-graphics/mesa/mesa-dri_9.0.2.bbappend<br>
        ERROR: Command execution failed: Exited with 1</font></small><br>
    <br>
    I put the meta-ti (via a git clone) into /home/yocto/poky-danny-8.0<br>
    <br>
    <font face="Courier New, Courier, monospace"><a class="moz-txt-link-abbreviated" href="mailto:grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$">grunzasr@stm32dbg:/home/yocto/poky-danny-8.0/build$</a>
      ls -l /home/yocto/poky-danny-8.0<br>
      total 72<br>
      drwxrwxr-x&nbsp; 6 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 bitbake<br>
      drwxrwxr-x&nbsp; 6 grunzasr grunzasr&nbsp; 4096 Mar 20 14:11 build<br>
      drwxrwxr-x 11 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 documentation<br>
      -rw-rw-r--&nbsp; 1 grunzasr grunzasr&nbsp;&nbsp; 545 Oct 22 19:03 LICENSE<br>
      drwxrwxr-x 21 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 meta<br>
      drwxrwxr-x&nbsp; 4 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 meta-hob<br>
      drwxrwxr-x&nbsp; 5 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 meta-skeleton<br>
      drwxr-xr-x 12 grunzasr grunzasr&nbsp; 4096 Mar 20 14:04 meta-ti<br>
      drwxrwxr-x&nbsp; 6 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 meta-yocto<br>
      drwxrwxr-x&nbsp; 9 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 meta-yocto-bsp<br>
      -rwxrwxr-x&nbsp; 1 grunzasr grunzasr&nbsp; 1531 Oct 22 19:03
      oe-init-build-env<br>
      -rw-rw-r--&nbsp; 1 grunzasr grunzasr&nbsp; 2038 Oct 22 19:03 README<br>
      -rw-rw-r--&nbsp; 1 grunzasr grunzasr 17245 Oct 22 19:03 README.hardware<br>
      drwxrwxr-x&nbsp; 8 grunzasr grunzasr&nbsp; 4096 Oct 22 19:03 scripts<br>
    </font><br>
    Is there another meta package I need?<br>
    <br>
    <br>
  </body>
</html>

--------------030507060006080303040201--
