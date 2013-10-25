Return-Path: <V.Vogelhuber@DigitalEndoscopy.de>
Received: from SRV-MSX01.digitendos.local
	(host-80-81-19-29.customer.m-online.net [80.81.19.29])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6B80E0176D
	for <meta-ti@yoctoproject.org>; Fri, 25 Oct 2013 04:20:09 -0700 (PDT)
Received: from [192.168.10.111] (192.168.10.111) by SRV-MSX01.digitendos.local
	(192.168.10.14) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Fri, 25 Oct 2013 13:20:07 +0200
Message-ID: <526A53E5.5080609@digitalendoscopy.de>
Date: Fri, 25 Oct 2013 13:20:05 +0200
From: Volker Vogelhuber <v.vogelhuber@digitalendoscopy.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: "Dmytriyenko, Denys" <denys@ti.com>
References: <526A4413.2090801@digitalendoscopy.de>	<20131025103033.GA13772@edge>,
	<526A4E00.2030505@digitalendoscopy.de>
	<B0581B5571079145BA1CD78C126DBDE72E908892@DLEE08.ent.ti.com>,
	<526A5113.5080905@digitalendoscopy.de>
	<B0581B5571079145BA1CD78C126DBDE72E908923@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E908923@DLEE08.ent.ti.com>
X-Originating-IP: [192.168.10.111]
X-TM-AS-Product-Ver: SMEX-10.1.0.2244-7.000.1014-20242.004
X-TM-AS-Result: No--34.797000-0.000000-31
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: State of dylan branch in meta-ti
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
X-List-Received-Date: Fri, 25 Oct 2013 11:20:10 -0000
Content-Type: multipart/alternative;
	boundary="------------070807060103020300090800"

--------------070807060103020300090800
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 25.10.2013 13:11, Dmytriyenko, Denys wrote:
>> On 25.10.2013 12:58, Dmytriyenko, Denys wrote:
>>> On 25.10.2013 12:30, Denys Dmytriyenko wrote:
>>>>>> On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:
>>>>>>> I just checked out the dylan branch of the yocto core and the
>>>>>>> meta-ti repository.
>>>>>>> It seems like the state of the meta-ti branch is not yet consistent
>>>>>>> to work out of the box.
>>>>>>>
>>>>>>> I currently had to remove the update-modules part from the ti
>>>>>>> recipes and had to add
>>>>>>> RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc
>>>>>>>
>>>>>>> Did I miss something or the dylan branch just not yet in a consistent state?
>>>>>> It's in great shape - better than ever! What you don't mention is what
>>>>>> platform you are using. You do mention dsplink though, but that is long since
>>>>>> unsupported. As a matter of fact, most of the old DSP related recipes are not
>>>>>> supported [1]. The new replacements are not ready yet. Other than that, it
>>>>>> provides great BSP support for platforms listed in the conf/ directory.
>>>>>>
>>>>>> [1]http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan
>>>>
>>>> Thanks for the link, actually I did not read that notice yet indeed.
>>>> I'm currently using a TAO-3530 board from technexion.
>>>> We used to work with the denzil branch for some time, but after 
>>>> updating to ubuntu
>>>> 13.10 there were a lot of errors that I tried to fix with the dylan 
>>>> branch. And indeed after
>>>> patching some small problems (next to the patches for the meta-ti 
>>>> branch), it does create
>>>> a rootfs image at least, but have to flash it and test if it has 
>>>> some additional problems.
>>>>
>>>> I only wonder why the problem with the kernel-module- package name 
>>>> does only occure with the
>>>> dsplink and not with the e.g. libgles modules as they seem to 
>>>> provide wrong package names as well.
>>>
>>>
>>> What do you mean by the wrong package name?
>> In the hello-mod_0.1bb script under meta-skeleton within the dylan 
>> branch of the yocto repository
>> there is the following notice:
>>
>> # Kernel module packages MUST begin with 'kernel-module-', otherwise
>> # multilib image generation can fail.
>> #
>> # The following line is only necessary if the recipe name does not begin
>> # with kernel-module-.
>> #
>> PKG_${PN} = "kernel-module-${PN}"
>>
>> I guess because there is a new bbclass within dylan called 
>> kernel-module-split.bbclass
>> that has the following lines adding dependencies automatically.
>>
>> ...
>>     if modules:
>>         metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE', True)
>>         d.appendVar('RDEPENDS_' + metapkg, ' '+' '.join(modules))
>>
>> the do_split_packages method called before that code gets executed 
>> seems to automatcally create
>> a list with kernel modules that all start with kernel-module-%s. I 
>> did not check what modules this method recognized. Maybe dsplinkk.ko 
>> was the only one and that's why the other modules did not
>> cause an error. Actually I did not spent to much time digging into 
>> the reason for introducing this bbclass at all.
>>
>> So to answer your question, all the module recipes within the meta-ti 
>> repository don't seem to be named with a "kernel-module-" prefix, but 
>> only the dsplinkk.ko module result in an error.
>>
> Because they don't have to be called that. The only extra thing the 
> new class does is sets up the dependencies. So even when a custom 
> module name is used, it will work fine.

Well then I don't understand why compiling the dsplink module causes an 
error during creation of the
RootFS when not adding the RPROVIDES_${PN} += "kernel-module-dsplinkk" 
to ti-dsplink.inc

Error log follows:

  Some packages could not be installed. This may mean that you have
| requested an impossible situation or if you are using the unstable
| distribution that some required packages have not yet been created
| or been moved out of Incoming.
| The following information may help to resolve the situation:
|
| The following packages have unmet dependencies:
|  ti-dsplink : Depends: kernel-module-dsplinkk but it is not installable
| E: Unable to correct problems, you have held broken packages.

Or is that error by design to avoid people using the dsplink module 
within dylan?
As mentioned, I did not test the resulting firmware image yet, so maybe 
there is indeed a problem with the modules, although I can't imagine why 
it shouldn't work as the used kernel is still the same.


--------------070807060103020300090800
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 25.10.2013 13:11, Dmytriyenko, Denys
      wrote:<span style="font-family:Calibri,Arial,Helvetica,sans-serif;
        font-size:11pt; color:black"><span style="color:black"><br>
        </span></span>
    </div>
    <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
      font-size:11pt; color:black"></span>
    <blockquote type="cite">
      <blockquote
        cite="mid:B0581B5571079145BA1CD78C126DBDE72E908923@DLEE08.ent.ti.com"
        type="cite">
        <div>
          <div class="moz-cite-prefix">On 25.10.2013 12:58, Dmytriyenko,
            Denys wrote:<span
              style="font-family:Calibri,Arial,Helvetica,sans-serif;
              font-size:11pt; color:black"><span style="color:black"><br>
              </span></span></div>
          <blockquote type="cite">
            <div>
              <div class="moz-cite-prefix">On 25.10.2013 12:30, Denys
                Dmytriyenko wrote:<br>
              </div>
              <blockquote type="cite">
                <blockquote type="cite">
                  <blockquote type="cite">
                    <pre>On Fri, Oct 25, 2013 at 12:12:35PM +0200, Volker Vogelhuber wrote:
</pre>
                    <blockquote type="cite">
                      <pre>I just checked out the dylan branch of the yocto core and the
meta-ti repository.
It seems like the state of the meta-ti branch is not yet consistent
to work out of the box.

I currently had to remove the update-modules part from the ti
recipes and had to add
RPROVIDES_${PN} += "kernel-module-dsplinkk" to the ti-dsplink.inc

Did I miss something or the dylan branch just not yet in a consistent state?
</pre>
                    </blockquote>
                    <pre>It's in great shape - better than ever! What you don't mention is what 
platform you are using. You do mention dsplink though, but that is long since 
unsupported. As a matter of fact, most of the old DSP related recipes are not 
supported [1]. The new replacements are not ready yet. Other than that, it 
provides great BSP support for platforms listed in the conf/ directory.

[1] <a moz-do-not-send="true" class="moz-txt-link-freetext" href="http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-ti/README?h=dylan</a>
</pre>
                  </blockquote>
                </blockquote>
                <br>
              </blockquote>
              <blockquote type="cite">Thanks for the link, actually I
                did not read that notice yet indeed.<br>
                I'm currently using a TAO-3530 board from technexion. <br>
                We used to work with the denzil branch for some time,
                but after updating to ubuntu
                <br>
                13.10 there were a lot of errors that I tried to fix
                with the dylan branch. And indeed after<br>
                patching some small problems (next to the patches for
                the meta-ti branch), it does create<br>
                a rootfs image at least, but have to flash it and test
                if it has some additional problems.<br>
                <br>
                I only wonder why the problem with the kernel-module-
                package name does only occure with the
                <br>
                dsplink and not with the e.g. libgles modules as they
                seem to provide wrong package names as well.</blockquote>
              <br>
              <br>
              <span
                style="font-family:Calibri,Arial,Helvetica,sans-serif;
                font-size:11pt; color:black">What do you mean by the
                wrong package name?<span style="color:black"></span></span></div>
          </blockquote>
          In the hello-mod_0.1bb script under meta-skeleton within the
          dylan branch of the yocto repository<br>
          there is the following notice:<br>
          <br>
          # Kernel module packages MUST begin with 'kernel-module-',
          otherwise<br>
          # multilib image generation can fail.<br>
          #<br>
          # The following line is only necessary if the recipe name does
          not begin<br>
          # with kernel-module-.<br>
          #<br>
          PKG_${PN} = "kernel-module-${PN}"<br>
          <br>
          I guess because there is a new bbclass within dylan called
          kernel-module-split.bbclass
          <br>
          that has the following lines adding dependencies
          automatically.<br>
          <br>
          ...<br>
          &nbsp;&nbsp;&nbsp; if modules:<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; metapkg = d.getVar('KERNEL_MODULES_META_PACKAGE',
          True)<br>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d.appendVar('RDEPENDS_' + metapkg, ' '+'
          '.join(modules))<br>
          <br>
          the do_split_packages method called before that code gets
          executed seems to automatcally create<br>
          a list with kernel modules that all start with
          kernel-module-%s. I did not check what modules this method
          recognized. Maybe dsplinkk.ko was the only one and that's why
          the other modules did not<br>
          cause an error. Actually I did not spent to much time digging
          into the reason for introducing this bbclass at all.<br>
          <br>
          So to answer your question, all the module recipes within the
          meta-ti repository don't seem to be named with a
          "kernel-module-" prefix, but only the dsplinkk.ko module
          result in an error.
          <br>
          <br>
        </div>
      </blockquote>
      <span style="font-family:Calibri,Arial,Helvetica,sans-serif;
        font-size:11pt; color:black">Because they don't have to be
        called that. The only extra thing the new class does is sets up
        the dependencies. So even when a custom module name is used, it
        will work fine.<br>
      </span></blockquote>
    <br>
    Well then I don't understand why compiling the dsplink module causes
    an error during creation of the <br>
    RootFS when not adding the RPROVIDES_${PN} +=
    "kernel-module-dsplinkk" to ti-dsplink.inc<br>
    <br>
    Error log follows:<br>
    <br>
    &nbsp;Some packages could not be installed. This may mean that you have<br>
    | requested an impossible situation or if you are using the unstable<br>
    | distribution that some required packages have not yet been created<br>
    | or been moved out of Incoming.<br>
    | The following information may help to resolve the situation:<br>
    | <br>
    | The following packages have unmet dependencies:<br>
    |&nbsp; ti-dsplink : Depends: kernel-module-dsplinkk but it is not
    installable<br>
    | E: Unable to correct problems, you have held broken packages.<br>
    <br>
    Or is that error by design to avoid people using the dsplink module
    within dylan?<br>
    As mentioned, I did not test the resulting firmware image yet, so
    maybe there is indeed a problem with the modules, although I can't
    imagine why it shouldn't work as the used kernel is still the same.<br>
    <br>
  </body>
</html>

--------------070807060103020300090800--
